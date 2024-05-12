import 'package:flash_chat/views/login_view.dart';
import 'package:flash_chat/views/register_view.dart';
import 'package:flash_chat/widgets/custom_elvated_button.dart';
import 'package:flash_chat/widgets/flash_chat_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlashChatLogo(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
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
