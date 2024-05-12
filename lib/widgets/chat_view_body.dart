import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/models/chat_details_model.dart';
import 'package:flash_chat/models/user_data.dart';
import 'package:flash_chat/widgets/error_message_from_db.dart';
import 'package:flash_chat/widgets/flash_chat_logo_app_bar.dart';
import 'package:flash_chat/widgets/input_message-text_field.dart';
import 'package:flash_chat/widgets/loading_indicator.dart';
import 'package:flash_chat/widgets/messages_list_view.dart';
import 'package:flutter/material.dart';

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
          const FlashChatLogoAppBar(),
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
                    child: MessagesListView(
                        listviewController: listviewController,
                        messages: messages,
                        widget: widget),
                  ),
                );
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
