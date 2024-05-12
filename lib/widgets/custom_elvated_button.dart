import 'package:flash_chat/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomElvatedButton extends StatelessWidget {
  const CustomElvatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final dynamic text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(4))),
      child: (text is String)
          ? Text(
              text,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )
          // ignore: prefer_const_constructors
          : CupertinoActivityIndicator(
              color: Colors.white,
            ),
    );
  }
}
