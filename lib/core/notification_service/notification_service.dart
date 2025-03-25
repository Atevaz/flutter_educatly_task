import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../main.dart';
import '../app_router/navigate_services.dart';
import '../app_router/screen_routes.dart';
import '../constant/constants.dart';
import '../di/di.dart';
import '../shared_preferences/preference_helper.dart';

bool isNotificationIsRequest = false ;
int unreadCount = 0 ;

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void requestAndRegisterNotification() async {
    // Request permissions
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      carPlay: true,
      criticalAlert: true,
      badge: true,
      provisional: true,
      sound: true,
    );
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    messaging.getToken().then((value) {
      myDeviceToken = value;
      preferenceHelper.saveDataSharedPreference(key: 'myDeviceToken', value: myDeviceToken);
      print('token is => $value');
    }).catchError((e){
      print('error to get token is ${e.toString()}');
    });
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User denied permission');
    }
  }

  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,{required bool fromCurrentRequestScreen}) async {
    var androidInitialize = const AndroidInitializationSettings('ic_launcher');
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationsSettings =
    InitializationSettings(android: androidInitialize, iOS: iOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onDidReceiveNotificationResponse: (onDidReceiveNotificationResponse) {},
    );
  }

  Future<void> firebaseNotificaitnInit(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    // final token = await FirebaseMessaging.instance.getToken();

    // print("SNDLKSNDLSD ${token}");

    FirebaseMessaging.onMessage.listen(
          (message) async {
        print('hello prices');
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        AppleNotification? ios = message.notification?.apple;

        AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
          android?.channelId ?? "high_importance_channel",
          'High Importance Notifications',
          enableVibration: true,
          // sound: RawResourceAndroidNotificationSound(android?.sound ?? ""),
          importance: Importance.max,
          priority: Priority.max,
          icon: '@drawable/ic_launcher',
          color: Colors.white,
        );

        print("soundAndroid ${android?.sound ?? ""}");
        print("soundIOS ${ios?.sound ?? ""}");

        var not = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: const DarwinNotificationDetails(),
        );


        if (Platform.isAndroid) {
          await flutterLocalNotificationsPlugin.show(notification.hashCode,
              notification?.title, notification?.body, not);
        }
      },
    );
  }

  Future<void> firebaseNotificaitnOpenMessage(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,) async {



    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) async {},
    );
  }


  Future<void> createChannel(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidNotificationChannel = const AndroidNotificationChannel(
      "high_importance_channel",
      "High Importance Notifications",
      description: "High Importance Notifications",
      importance: Importance.max,
      // sound: RawResourceAndroidNotificationSound(sound),
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);
  }



}
