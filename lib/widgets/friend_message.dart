import 'package:flash_chat/contants.dart';
import 'package:flash_chat/models/chat_details_model.dart';
import 'package:flutter/material.dart';

class FriendMessage extends StatelessWidget {
  const FriendMessage({
    super.key,
    required this.message,
  });
  final ChatMessageModel message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 185, 184, 184),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text(
                  "${message.firstName} ${message.lastName}",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.brown[900]),
                ),
              ),
              Text(
                message.body,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
