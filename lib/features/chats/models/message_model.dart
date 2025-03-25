import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? senderId ,receiverId , text ;
  DateTime? dateTime ;

  MessageModel({this.senderId, this.receiverId,this.dateTime, this.text});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['senderId'] = senderId;
    data['receiverId'] = receiverId;
    data['dateTime'] = FieldValue.serverTimestamp();
    data['text'] = text;
    return data;
  }

  MessageModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    dateTime = json['dateTime'] ==null ? DateTime.now() : json['dateTime'].toDate();
    text = json['text'];
  }

}