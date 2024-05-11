import 'package:flash_chat/models/chat_details_model.dart';
import 'package:flutter/material.dart';

class MyMessage extends StatelessWidget {
  const MyMessage({super.key, required this.message});
  final ChatMessageModel message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: const BoxDecoration(
              color: Color(0xff000044),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text(
                  message.firstName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.lightGreenAccent),
                ),
              ),
              Text(
                message.body,
                style: const TextStyle(
                  color: Color.fromARGB(255, 224, 224, 224),
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
