import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_educatly_task/core/constant/constants.dart';
import 'package:flutter_educatly_task/features/chats/models/message_model.dart';
import 'package:meta/meta.dart';

part 'get_messages_state.dart';

class GetMessagesCubit extends Cubit<GetMessagesState> {
  GetMessagesCubit() : super(GetMessagesInitial());

  static GetMessagesCubit get(context) => BlocProvider.of(context);

  List<MessageModel> messagesList = [];

  ScrollController scrollController = ScrollController();


  Future<void> getMessages({required String receiverId}) async {
    emit(GetAllMessageLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages').orderBy("dateTime",descending: true)
        .snapshots()
        .listen((event) {
      messagesList = [];
      for (var element in event.docs) {
        messagesList.add(MessageModel.fromJson(element.data()));
        print(messagesList.last.dateTime.toString());
      }
      scrollController.position.animateTo(
        scrollController.position.minScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      emit(GetAllMessageSuccessState());
    });
  }
}
