import 'package:flash_chat/models/chat_details_model.dart';
import 'package:flash_chat/widgets/chat_view_body.dart';
import 'package:flash_chat/widgets/friend_message.dart';
import 'package:flash_chat/widgets/my_message.dart';
import 'package:flutter/material.dart';

class MessagesListView extends StatelessWidget {
  const MessagesListView({
    super.key,
    required this.listviewController,
    required this.messages,
    required this.widget,
  });

  final ScrollController listviewController;
  final List<ChatMessageModel> messages;
  final ChatViewBody widget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
