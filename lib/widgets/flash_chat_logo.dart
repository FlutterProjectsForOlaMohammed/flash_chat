import 'package:flash_chat/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashChatLogo extends StatelessWidget {
  const FlashChatLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
        )
      ],
    );
  }
}
