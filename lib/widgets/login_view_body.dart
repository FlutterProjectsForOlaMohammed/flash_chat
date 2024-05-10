import 'package:flash_chat/contants.dart';
import 'package:flash_chat/cubit/LoginAuthentication/login_authentication_cubit.dart';
import 'package:flash_chat/widgets/another_login_way.dart';
import 'package:flash_chat/widgets/custom_text_field.dart';
import 'package:flash_chat/widgets/login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String email = '', password = "";
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                LoginButton(formKey: formKey, email: email, password: password),
                const SizedBox(
                  height: 40,
                ),
                AnotherLoginWay(
                  size: 30,
                  onTap: () async {
                    await BlocProvider.of<LoginAuthenticationCubit>(context)
                        .loginWithGoogle();
                  },
                  icon: FontAwesomeIcons.g,
                  text: "Login With Google Account",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
