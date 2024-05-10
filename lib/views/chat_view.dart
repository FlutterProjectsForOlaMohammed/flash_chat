import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  CollectionReference<Map<String, dynamic>> firestore =
      FirebaseFirestore.instance.collection("messages");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: ChatViewBody(firestore: firestore),
    );
  }
}
