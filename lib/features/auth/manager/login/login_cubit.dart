import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/shared_preferences/preference_helper.dart';
import '../../../../core/app_router/navigate_services.dart';
import '../../../../core/app_router/screen_routes.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/di/di.dart';
import '../../../../core/widgets/toast.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(AuthInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  void login({
    required String email,
    required String password,
  }) {
    try {
      emit(LoginLoadingState());
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      )
          .then((value) async {
        userId = value.user!.uid;
        preferenceHelper.saveDataSharedPreference(key: 'userId', value: userId);
        NavigatorService.pushNamedAndRemoveUntil(AppRouterNames.homeRoute) ;
        emit(LoginSuccessState()); //value.user!.uid
      }).catchError((error) {
        emit(LoginErrorState());
        print("error From Try ${error.toString()}");
        showToast(text: 'Error When Login', state: ToastStates.ERROR);
      });
    } catch (error) {
      emit(LoginErrorState());
      print("error From catch ${error.toString()}");
      showToast(text: 'Error When Login', state: ToastStates.ERROR);
    }
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }
}
