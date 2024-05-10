import 'package:flash_chat/cubit/LoginAuthentication/login_authentication_cubit.dart';
import 'package:flash_chat/views/chat_view.dart';
import 'package:flash_chat/widgets/custom_elvated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.email,
    required this.password,
  });

  final GlobalKey<FormState> formKey;
  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginAuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return CustomElvatedButton(
          text: (state is AuthenticationLoginLoading)
              ? const CupertinoActivityIndicator()
              : "Login",
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              await BlocProvider.of<LoginAuthenticationCubit>(context)
                  .login(email: email, password: password);
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) {
                    return const ChatView();
                  },
                ),
              );
            }
          },
        );
      },
    );
  }
}
