import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/contants.dart';
import 'package:flash_chat/widgets/error_message_from_db.dart';
import 'package:flash_chat/widgets/friend_message.dart';
import 'package:flash_chat/widgets/loading_indicator.dart';
import 'package:flash_chat/widgets/my_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({
    super.key,
    required this.firestore,
  });

  final CollectionReference<Map<String, dynamic>> firestore;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Card(
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
          ),
          StreamBuilder(
            stream: firestore.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const ErrorMessageFromDB();
              } else if (snapshot.hasData) {
                return const Expanded(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [FriendMessage(), MyMessage()],
                  ),
                ));
              } else {
                return const LoadingIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
