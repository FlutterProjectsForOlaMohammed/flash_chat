import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/contants.dart';
import 'package:flash_chat/models/chat_details_model.dart';
import 'package:flash_chat/models/user_data.dart';
import 'package:flash_chat/widgets/error_message_from_db.dart';
import 'package:flash_chat/widgets/friend_message.dart';
import 'package:flash_chat/widgets/input_message-text_field.dart';
import 'package:flash_chat/widgets/loading_indicator.dart';
import 'package:flash_chat/widgets/my_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({
    super.key,
    required this.user,
  });

  final UserData user;

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  CollectionReference<Map<String, dynamic>> firestore =
      FirebaseFirestore.instance.collection("messages");
  ScrollController listviewController = ScrollController();

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
            stream: firestore.orderBy('date', descending: true).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const ErrorMessageFromDB();
              } else if (snapshot.hasData) {
                ChatMessageModel.allMessagesFromFB(snapshot.data!.docs);
                List<ChatMessageModel> messages = ChatMessageModel.allMessages;
                goToLastMessageAnimation();
                return Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListView.builder(
                    controller: listviewController,
                    physics: BouncingScrollPhysics(),
                    reverse: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      if (messages[index].email == widget.user.email) {
                        return MyMessage(message: messages[index]);
                      } else {
                        return FriendMessage(message: messages[index]);
                      }
                    },
                  ),
                ));
              } else {
                return const LoadingIndicator();
              }
            },
          ),
          InputMessageTextField(
            user: widget.user,
          ),
        ],
      ),
    );
  }

  void goToLastMessageAnimation() {
    if (listviewController.hasClients) {
      listviewController.jumpTo(
        listviewController.position.minScrollExtent,
      );
    }
  }
}
