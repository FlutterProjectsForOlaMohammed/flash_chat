import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/contants.dart';
import 'package:flash_chat/models/user_data.dart';
import 'package:flutter/material.dart';

class InputMessageTextField extends StatefulWidget {
  const InputMessageTextField({super.key, required this.user});
  final UserData user;
  @override
  State<InputMessageTextField> createState() => _InputMessageTextFieldState();
}

class _InputMessageTextFieldState extends State<InputMessageTextField> {
  bool isActive = false;
  String textSend = '';
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: TextFormField(
          controller: textController,
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
              onPressed: () async {
                if (isActive) {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    setState(() {
                      textController.clear();
                      isActive = false;
                    });
                    CollectionReference firestore =
                        FirebaseFirestore.instance.collection("messages");
                    await firestore.add({
                      'email': widget.user.email,
                      'body': textSend,
                      'first name': widget.user.firstName,
                      'last name': widget.user.lastName,
                      'date': DateTime.now().toString(),
                    });
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
