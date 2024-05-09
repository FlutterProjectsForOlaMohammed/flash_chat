import 'package:flash_chat/contants.dart';
import 'package:flash_chat/cubit/RegisterAuthentication/register_authentication_cubit.dart';
import 'package:flash_chat/widgets/custom_elvated_button.dart';
import 'package:flash_chat/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String firstName = '',
      lastName = '',
      email = '',
      password = "",
      confirmedPassword = '';
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: BlocProvider(
            create: (context) => RegisterAuthenticationCubit(),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "splashPic",
                        child: SvgPicture.asset(
                          "assets/flash (1).svg",
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Text(
                        "Flash Chat",
                        style: GoogleFonts.pacifico(
                          color: kPrimaryColor,
                          fontSize: 32,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const Text(
                        "one message to all",
                        style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor,
                            letterSpacing: 2,
                            wordSpacing: 2),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
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
                                  await BlocProvider.of<
                                          RegisterAuthenticationCubit>(context)
                                      .register(UserData(
                                          firstName: firstName,
                                          lastName: lastName,
                                          email: email,
                                          password: password));
                                } else {
                                  await toastMessage(
                                      msg:
                                          "Please, Confirm Password Correctly ");
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
            ),
          ),
        ),
      ),
    );
  }
}
