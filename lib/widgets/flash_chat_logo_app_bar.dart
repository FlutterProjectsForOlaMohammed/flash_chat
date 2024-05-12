import 'package:flash_chat/contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashChatLogoAppBar extends StatelessWidget {
  const FlashChatLogoAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 25,
      color: Colors.transparent,
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          Hero(
            tag: "splashPic",
            child: SvgPicture.asset(
              "assets/flash (1).svg",
              height: 35,
              width: 35,
            ),
          ),
          Text(
            "Flash Chat",
            style: GoogleFonts.pacifico(
              color: kPrimaryColor,
              fontSize: 24,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
