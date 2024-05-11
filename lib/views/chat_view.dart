import 'package:flash_chat/models/user_data.dart';
import 'package:flash_chat/widgets/chat_view_body.dart';

import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.user});
  final UserData user;
  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ChatViewBody(
        user: widget.user,
      ),
    );
  }
}
