import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/contants.dart';
import 'package:flash_chat/cubit/LoginAuthentication/login_authentication_cubit.dart';
import 'package:flash_chat/models/user_data.dart';
import 'package:flash_chat/views/chat_view.dart';
import 'package:flash_chat/widgets/another_login_way.dart';
import 'package:flash_chat/widgets/custom_elvated_button.dart';
import 'package:flash_chat/widgets/custom_text_field.dart';
import 'package:flash_chat/widgets/flash_chat_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '', password = "";
  UserData? user;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlashChatLogo(),
          CustomTextField(
            onSaved: (value) {
              email = value!;
            },
            label: "Email",
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return emailValidation(value);
              }
              return "Required";
            },
          ),
          CustomTextField(
            onSaved: (value) {
              password = value!;
            },
            label: "Password",
            obsureText: true,
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                return passwordValidation(value);
              } else {
                return "Required";
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
          BlocConsumer<LoginAuthenticationCubit, AuthenticationState>(
            listener: (context, state) async {
              if (state is AuthenticationLoginSuccess) {
                user = await getSenderData(email: email);
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return ChatView(
                        user: UserData(
                          firstName: user!.firstName,
                          lastName: user!.lastName,
                          email: user!.email,
                        ),
                      );
                    },
                  ),
                );
              }
            },
            builder: (context, state) {
              return CustomElvatedButton(
                text: (state is AuthenticationLoginLoading)
                    ? const CupertinoActivityIndicator()
                    : "Login",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    await BlocProvider.of<LoginAuthenticationCubit>(context)
                        .login(
                      email: email,
                      password: password,
                    );
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          AnotherLoginWay(
            size: 30,
            onTap: () async {
              UserCredential googleUser =
                  await BlocProvider.of<LoginAuthenticationCubit>(context)
                      .loginWithGoogle();

              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (contex) {
                    return ChatView(
                      user: UserData(
                        firstName: googleUser.user!.displayName!,
                        lastName: "",
                        email: googleUser.user!.email!,
                      ),
                    );
                  },
                ),
              );
            },
            icon: FontAwesomeIcons.g,
            text: "Login With Google Account",
          )
        ],
      ),
    );
  }
}
