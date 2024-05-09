import 'package:flash_chat/contants.dart';
import 'package:flash_chat/views/login_view.dart';
import 'package:flash_chat/views/register_view.dart';
import 'package:flash_chat/widgets/custom_elvated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
            height: 25,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonPadding: const EdgeInsets.all(24),
            children: [
              CustomElvatedButton(
                text: "Login",
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (contxet) {
                        return const LoginView();
                      },
                    ),
                  );
                },
              ),
              CustomElvatedButton(
                text: "Register",
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (contxet) {
                        return const RegisterView();
                      },
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
