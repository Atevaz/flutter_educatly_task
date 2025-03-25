import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_educatly_task/core/constant/constants.dart';
import 'package:meta/meta.dart';

part 'update_user_status_state.dart';

class UpdateUserStatusCubit extends Cubit<UpdateUserStatusState> {
  UpdateUserStatusCubit() : super(UpdateUserStatusInitial());

  static UpdateUserStatusCubit get(context) => BlocProvider.of(context);

  Future<void> updateUserStatus({required bool status}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({"onlineStatus": status}).then((value) {
      emit(UpdateUserStatusSuccessState());
    }).catchError((error) {
      emit(UpdateUserStatusErrorState());
    });
  }
}
