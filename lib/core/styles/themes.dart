import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../colors/app_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: AppColor.backgroundColorLight,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColor.inputColorDark,
  ),
  appBarTheme: AppBarTheme(
    elevation: 0,
    titleSpacing: 12,
    scrolledUnderElevation: 0,
    actionsIconTheme: const IconThemeData(
      color: Colors.black54,
    ),
    backgroundColor: AppColor.backgroundColorLight,
    iconTheme: const IconThemeData(
      color: AppColor.textColorLight,
    ),
    titleTextStyle: TextStyle(
      fontSize: 24.sp,
      color: AppColor.textColorDark,
      fontFamily: 'Roboto',
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: AppColor.backgroundColorLight,
    selectedItemColor: AppColor.textColorDark,
    unselectedItemColor: AppColor.paragraphColor,
    elevation: 0,
    selectedLabelStyle: TextStyle(
      fontFamily: 'Roboto',
      height: 0,
      fontWeight: FontWeight.w500,
      fontSize: 10,
    ),
    unselectedLabelStyle: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 10,
        height: 0,
        fontWeight: FontWeight.w500),
    selectedIconTheme: IconThemeData(
      size: 15,
    ),
    unselectedIconTheme: IconThemeData(
      size: 15,
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColor.textColorLight,
  ),
  fontFamily: 'Roboto',

);

ThemeData darkTheme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: AppColor.backgroundColorDark,
  appBarTheme: const AppBarTheme(
    titleSpacing: 12,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor:AppColor.backgroundColorDark,
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      fontSize: 24,
      color: AppColor.textColorLight,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: const Color(0xff242526),
    selectedItemColor: AppColor.textColorLight,
    unselectedItemColor: AppColor.paragraphColor,
    elevation: 0,
    selectedLabelStyle: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12.sp,
    ),
    unselectedLabelStyle: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12.sp,
    ),
    selectedIconTheme: const IconThemeData(
      size: 20,
    ),
    unselectedIconTheme: const IconThemeData(
      size: 20,
    ),
  ),
  fontFamily: 'Roboto',
  iconTheme: const IconThemeData(
    color: AppColor.textColorDark,
  ),
);
