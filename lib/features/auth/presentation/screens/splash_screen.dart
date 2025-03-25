import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_educatly_task/core/app_router/navigate_services.dart';
import '../../../../core/app_router/screen_routes.dart';
import '../../../../core/constant/constants.dart';
import '../../../../core/widgets/texts/big_text.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool isDefaultOpacity = true ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    preferenceHelper.getString(key: 'userId').then((value) {
      userId = value;
      debugPrint('userId $userId');
    });

    Future.delayed(const Duration(seconds: 0)).then((value){
      setState(() {
        isDefaultOpacity = !isDefaultOpacity ;
      });
    });

    Future.delayed(const Duration(seconds: 2)).then((value) {

      if (userId == null) {
        NavigatorService.pushNamedAndRemoveUntil(
          AppRouterNames.loginRoute,
        );
      }

      else {
        NavigatorService.pushNamedAndRemoveUntil(
          AppRouterNames.homeRoute,
        );
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(seconds: 2),
          opacity: isDefaultOpacity == true ? 0 : 1 ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigText(text: 'Flutter Educatly Task',fontSize: 48,)
            ],
          ),
        ),
      ),
    );
  }
}
