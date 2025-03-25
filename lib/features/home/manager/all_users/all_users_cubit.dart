import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_educatly_task/core/constant/constants.dart';
import 'package:flutter_educatly_task/features/auth/data/models/response/user_model.dart';
import 'package:meta/meta.dart';

part 'all_users_state.dart';

class AllUsersCubit extends Cubit<AllUsersState> {
  AllUsersCubit() : super(AllUsersInitial());

  static AllUsersCubit get(context) => BlocProvider.of(context);

  List <UserModel> allUsersList = [] ;

  Future<void> getAllUsers() async {
    emit(GetAllUsersLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .listen((event) {
      allUsersList = [];
      for (var element in event.docs) {
        allUsersList.add(UserModel.fromJson(element.data()));
      }
      allUsersList = allUsersList.where((element) => element.userId != userId).toList();
      emit(GetAllUsersSuccessState());
    });
  }

  UserModel? selectedUserModel ;

  void changeSelectedUser ({required UserModel user}) {
    selectedUserModel = user ;
    print(selectedUserModel!.name);
    print(selectedUserModel!.email);
    print(selectedUserModel!.deviceToken);
    print(selectedUserModel!.onlineStatus);
    print(selectedUserModel!.userId);
    emit(ChangeSelectedUserModelState());
  }

}
