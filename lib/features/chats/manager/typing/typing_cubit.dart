import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/constant/constants.dart';

part 'typing_state.dart';

class TypingCubit extends Cubit<TypingState> {
  TypingCubit() : super(TypingInitial());

  static TypingCubit get(context) => BlocProvider.of(context);

  bool isUserTyping = false;

  Future<void> userTyping(
      {required String receiverId, required bool isUserTyping}) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userId)
        .set({"isUserTyping": isUserTyping}).then((value) {
      emit(UserTypingSuccessState());
    }).catchError((error) {
      emit(UserTypingErrorState());
    });
  }

  Future<void> listenToTyping({required String receiverId}) async {
    try{
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('chats')
          .doc(receiverId)
          .snapshots()
          .listen((event) {
            if(event.exists) {
              isUserTyping = event['isUserTyping'] ?? false;
            }
        // print(event.toString());
        emit(ListenToUserTypingState());
      });
    }
    catch (error) {
      emit(UserTypingErrorState());
    }
  }
}
