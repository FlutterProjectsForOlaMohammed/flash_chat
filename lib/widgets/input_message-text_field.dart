import 'package:flash_chat/contants.dart';
import 'package:flutter/material.dart';

class InputMessageTextField extends StatefulWidget {
  const InputMessageTextField({super.key});

  @override
  State<InputMessageTextField> createState() => _InputMessageTextFieldState();
}

class _InputMessageTextFieldState extends State<InputMessageTextField> {
  bool isActive = false;
  String textSend = '';
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: TextFormField(
          validator: (value) {
            setState(() {
              if (value?.isEmpty ?? true) {
                isActive = false;
              }
              isActive = true;
            });
            return null;
          },
          cursorColor: kPrimaryColor,
          onSaved: (value) {
            textSend = value!;
          },
          style: const TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.w500),
          onChanged: (value) {
            if (value == "") {
              setState(() {
                isActive = false;
              });
            } else {
              setState(() {
                isActive = true;
              });
            }
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                if (isActive) {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                }
              },
              icon: Icon(
                Icons.send,
                color: (isActive) ? kPrimaryColor : Colors.grey,
              ),
            ),
            hintText: "send a message",
            contentPadding: const EdgeInsets.all(16),
            focusedErrorBorder: textFieldBorder(),
            enabledBorder: textFieldBorder(),
            focusedBorder: textFieldBorder(),
            errorBorder: textFieldBorder(),
          ),
        ),
      ),
    );
  }
}
