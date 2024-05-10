import 'package:flash_chat/contants.dart';
import 'package:flutter/material.dart';

class ErrorMessageFromDB extends StatelessWidget {
  const ErrorMessageFromDB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration:
                  BoxDecoration(border: Border.all(color: kPrimaryColor)),
              child: const Text(
                "Something went wrong , please try again .",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
