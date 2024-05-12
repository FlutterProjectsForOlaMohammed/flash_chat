import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/models/user_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

const Color kPrimaryColor = Color(0xff000044);
String? passwordValidation(String value) {
  final bool passwordValid =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(value);
  if (passwordValid) {
    return null;
  } else {
    return "Your Password must Contain at least one upper case \n, at least one lower case , at least one digit \n, at least one Special character and at least\n 8 characters in length  ";
  }
}

String? emailValidation(String value) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  if (emailValid) {
    return null;
  } else {
    return "Enter Correct Email , please";
  }
}

OutlineInputBorder textFieldBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(color: kPrimaryColor),
      borderRadius: BorderRadius.circular(3));
}

Future<void> toastMessage({required String msg}) async {
  await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[400],
      textColor: kPrimaryColor,
      fontSize: 16.0);
}

Future<UserData> getSenderData({required String email}) async {
  CollectionReference getUserData =
      FirebaseFirestore.instance.collection("Users");
  QuerySnapshot query =
      await getUserData.where('email', isEqualTo: email).get();
  late UserData user;
  for (int i = 0; i < query.docs.length; i++) {
    user = UserData(
      firstName: query.docs.first['first name'],
      lastName: query.docs.first['last name'],
      email: query.docs.first['email'],
    );
  }
  return user;
}
