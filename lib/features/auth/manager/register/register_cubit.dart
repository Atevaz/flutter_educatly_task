import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_educatly_task/core/app_router/navigate_services.dart';
import 'package:flutter_educatly_task/core/app_router/screen_routes.dart';
import 'package:flutter_educatly_task/features/auth/data/models/request/create_user_request_model.dart';
import 'package:meta/meta.dart';

import '../../../../core/constant/constants.dart';
import '../../../../core/di/di.dart';
import '../../../../core/shared_preferences/preference_helper.dart';
import '../../../../core/widgets/toast.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);


  void register({
    required CreateUserRequestModel createUserRequestModel,
  }) {
    try{
      emit(RegisterLoadingState());
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserRequestModel.email!.trim(),
        password: createUserRequestModel.password!,
      ).then((value) {

        userId = value.user!.uid;
        preferenceHelper.saveDataSharedPreference(key: 'userId', value: userId);
        FirebaseFirestore.instance.collection('users').doc(userId).set(
          createUserRequestModel.toJson(),
        );
        FirebaseFirestore.instance.collection('users').doc(userId).update({"userId" : userId});
        NavigatorService.pushNamedAndRemoveUntil(AppRouterNames.homeRoute) ;

        emit(RegisterSuccessState()); //value.user!.uid
      }).catchError((error) {
        emit(RegisterErrorState());
        showToast(text: 'Error When Create Account', state: ToastStates.ERROR);
      });
    }
    catch(error){
      emit(RegisterErrorState());
      showToast(text: 'Error When Create Account', state: ToastStates.ERROR);
    }
  }


}
