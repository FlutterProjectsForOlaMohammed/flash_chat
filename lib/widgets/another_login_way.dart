import 'package:flash_chat/contants.dart';
import 'package:flutter/material.dart';

class AnotherLoginWay extends StatelessWidget {
  const AnotherLoginWay({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.size,
  });
  final IconData icon;
  final String text;
  final void Function() onTap;
  final double size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(224, 224, 224, 0.857),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: kPrimaryColor,
                size: size,
              ),
              const SizedBox(
                width: 13,
              ),
              Text(
                text,
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
