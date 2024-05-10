import 'package:flash_chat/cubit/LoginAuthentication/login_authentication_cubit.dart';
import 'package:flash_chat/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginAuthenticationCubit(),
          child: const LoginViewBody(),
        ),
      ),
    );
  }
}
