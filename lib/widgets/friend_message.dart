import 'package:flash_chat/contants.dart';
import 'package:flutter/material.dart';

class FriendMessage extends StatelessWidget {
  const FriendMessage({
    super.key,
  });

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
          child: const Text(
            "Ola Mohammed Fathy Ahmed",
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
