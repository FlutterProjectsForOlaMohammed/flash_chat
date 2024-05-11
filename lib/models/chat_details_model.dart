import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessageModel {
  late String firstName, lastName, body, email;
  late DateTime date;
  static List<ChatMessageModel> allMessages = [];
  ChatMessageModel(
      {required this.firstName,
      required this.lastName,
      required this.body,
      required this.email,
      required this.date});
  ChatMessageModel.allMessagesFromFB(List<QueryDocumentSnapshot> data) {
    allMessages = [];

    for (int i = 0; i < data.length; i++) {
      allMessages.add(ChatMessageModel(
        firstName: data[i]['first name'],
        lastName: data[i]['last name'],
        body: data[i]['body'],
        email: data[i]['email'],
        date: DateTime.parse(data[i]['date'].toString()),
      ));
    }
  }
}
