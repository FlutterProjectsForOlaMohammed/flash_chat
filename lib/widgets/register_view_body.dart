import 'package:flash_chat/cubit/RegisterAuthentication/register_authentication_cubit.dart';
import 'package:flash_chat/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: BlocProvider(
          create: (context) => RegisterAuthenticationCubit(),
          child: const RegisterForm(),
        ),
      ),
    );
  }
}
