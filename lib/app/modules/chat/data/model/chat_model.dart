import 'package:chat_flutter/app/core/db/db.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  ChatModel.data(
    this.reference, [
    this.userEmail,
    this.photoUrl,
    this.chatMessage,
    this.date,
    this.isUserMessage,
  ]);

  /// [ChatModel]
  factory ChatModel.from(DocumentSnapshot document) {
    final isMsg = (document.data()['userEmail'] == DB.box.get(DB.email)) ?? false;
    return ChatModel.data(
      document.reference,
      document.data()['userEmail'],
      document.data()['photoUrl'],
      document.data()['chatMessage'],
      document.data()['date'],
      isMsg,
    );
  }

  ///
  final DocumentReference reference;

  ///
  final String userEmail, photoUrl, chatMessage;

  ///
  final int date;

  ///
  final bool isUserMessage;
}
