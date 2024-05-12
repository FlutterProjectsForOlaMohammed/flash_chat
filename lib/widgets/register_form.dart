import 'package:flash_chat/contants.dart';
import 'package:flash_chat/cubit/RegisterAuthentication/register_authentication_cubit.dart';
import 'package:flash_chat/models/user_data.dart';
import 'package:flash_chat/views/chat_view.dart';
import 'package:flash_chat/widgets/custom_elvated_button.dart';
import 'package:flash_chat/widgets/custom_text_field.dart';
import 'package:flash_chat/widgets/flash_chat_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String firstName = '',
      lastName = '',
      email = '',
      password = "",
      confirmedPassword = '';
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlashChatLogo(),
              CustomTextField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Required";
                  }
                  return null;
                },
                onSaved: (value) {
                  firstName = value!;
                },
                label: "First Name",
              ),
              CustomTextField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Required";
                  }
                  return null;
                },
                onSaved: (value) {
                  lastName = value!;
                },
                label: "Last Name",
              ),
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
              CustomTextField(
                onSaved: (value) {
                  confirmedPassword = value!;
                },
                label: "Confirm Password",
                obsureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return "Required";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              BlocBuilder<RegisterAuthenticationCubit,
                  RegisterAuthenticationState>(
                builder: (context, state) {
                  return CustomElvatedButton(
                    text: (state is AuthenticationRegisterLoading)
                        ? const CupertinoActivityIndicator()
                        : "Register",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (password == confirmedPassword) {
                          await BlocProvider.of<RegisterAuthenticationCubit>(
                                  context)
                              .register(
                                  user: UserData(
                                      firstName: firstName,
                                      lastName: lastName,
                                      email: email),
                                  password: password);
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) {
                                return ChatView(
                                  user: UserData(
                                    firstName: firstName,
                                    lastName: lastName,
                                    email: email,
                                  ),
                                );
                              },
                            ),
                          );
                        } else {
                          await toastMessage(
                              msg: "Please, Confirm Password Correctly ");
                        }
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
