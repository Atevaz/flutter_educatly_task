import 'package:easy_localization/easy_localization.dart';

import '../di/di.dart';
import '../firebase/firebase_auth/firebase_auth_service.dart';
import '../firebase/firebase_firestore/firestore_service.dart';
import '../shared_preferences/preference_helper.dart';

String? userId;
String? myDeviceToken ;

String convertDateToTime ({required String date}){
  DateTime dateTime = DateTime.parse(date).toLocal();
  String formattedTime = DateFormat('hh:mm a',"en").format(dateTime);
  return formattedTime ;
}

String convertDateToDate ({required String date}){
  DateTime dateTime = DateTime.parse(date).toLocal();
  String dayName = DateFormat.EEEE('ar').format(dateTime);
  String formattedTime = "$dayName ${dateTime.day}/ ${dateTime.month} / ${dateTime.year}";
  return formattedTime ;
}

PreferenceHelper preferenceHelper = PreferenceHelper(preferencesProvider: sl());
FirebaseService firebaseService = sl<FirebaseService>();
FirebaseAuthService firebaseAuthService = sl<FirebaseAuthService>();
