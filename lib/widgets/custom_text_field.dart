import 'package:flash_chat/contants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.onSaved,
      required this.label,
      this.obsureText = false,
      required this.validator});
  final void Function(String?) onSaved;
  final String label;
  final bool obsureText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        validator: validator,
        cursorColor: kPrimaryColor,
        onSaved: onSaved,
        obscureText: obsureText,
        style:
            const TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            hintText: label,
            labelText: label,
            labelStyle: const TextStyle(color: kPrimaryColor),
            contentPadding: const EdgeInsets.all(16),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(3)),
            enabledBorder: textFieldBorder(),
            focusedBorder: textFieldBorder(),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(3))),
      ),
    );
  }
}
