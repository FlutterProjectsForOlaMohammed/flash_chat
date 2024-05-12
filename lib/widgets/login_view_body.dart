import 'package:flash_chat/widgets/login_form.dart';
import 'package:flutter/cupertino.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: LoginForm(),
        ),
      ),
    );
  }
}
