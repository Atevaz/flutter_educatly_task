import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_educatly_task/core/constant/constants.dart';
import 'package:meta/meta.dart';

import '../../models/message_model.dart';

part 'send_message_state.dart';

class SendMessageCubit extends Cubit<SendMessageState> {
  SendMessageCubit() : super(SendMessageInitial());

  static SendMessageCubit get(context) => BlocProvider.of(context);


  Future<void> sendMessage({required MessageModel messageModel}) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('chats')
        .doc(messageModel.receiverId)
        .collection('messages')
        .add(messageModel.toJson())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(messageModel.receiverId)
        .collection('chats')
        .doc(userId)
        .collection('messages')
        .add(messageModel.toJson())
        .then((value) {
      emit(SendMessageSuccessState());
    }).catchError((error) {
      emit(SendMessageErrorState());
    });


  }
}
