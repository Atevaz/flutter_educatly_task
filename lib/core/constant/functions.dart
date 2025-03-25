import 'package:flutter/cupertino.dart';
import 'package:flutter_educatly_task/core/app_router/navigate_services.dart';
import 'package:flutter_educatly_task/core/app_router/screen_routes.dart';
import 'package:flutter_educatly_task/core/constant/constants.dart';
import 'package:flutter_educatly_task/features/home/manager/all_users/all_users_cubit.dart';
import 'package:intl/intl.dart';
import '../../features/home/manager/update_user_status/update_user_status_cubit.dart';

void logoutFun (BuildContext context){
  UpdateUserStatusCubit.get(context).updateUserStatus(status: false);
  AllUsersCubit.get(context).allUsersList = [];
  preferenceHelper.removeData(key: 'userId');
  NavigatorService.pushNamedAndRemoveUntil(AppRouterNames.loginRoute);
}



String formatDateTime(DateTime inputDateTime) {
  // تحويل التاريخ المدخل إلى كائن DateTime
  DateTime dateTime = inputDateTime;

  // تحويل التاريخ إلى توقيت الجهاز المحلي
  dateTime = dateTime.toLocal();

  // الحصول على الوقت الحالي (التوقيت المحلي للجهاز)
  DateTime now = DateTime.now();

  // تنسيق الوقت
  String timeFormatted = DateFormat('h:mm a').format(dateTime);

  // مقارنة التواريخ
  if (dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day) {
    // إذا كان نفس اليوم
    return timeFormatted;
  } else if (dateTime.year == now.year && dateTime.month == now.month && dateTime.day == now.day - 1) {
    // إذا كان تاريخ أمس
    return 'Yesterday $timeFormatted';
  } else {
    // إذا كان تاريخ قديم
    String dateFormatted = DateFormat('yyyy-MM-dd').format(dateTime);
    return '$dateFormatted  $timeFormatted';
  }
}