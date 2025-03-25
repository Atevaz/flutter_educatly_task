import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_educatly_task/features/auth/manager/login/login_cubit.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/di.dart' as di;
import 'core/app_router/app_router.dart';
import 'core/global_cubit/global/global_cubit.dart';
import 'core/notification_service/notification_service.dart';
import 'core/styles/themes.dart';
import 'features/auth/manager/register/register_cubit.dart';
import 'features/chats/manager/get_messages/get_messages_cubit.dart';
import 'features/chats/manager/send_message/send_message_cubit.dart';
import 'features/chats/manager/typing/typing_cubit.dart';
import 'features/home/manager/all_users/all_users_cubit.dart';
import 'features/home/manager/update_user_status/update_user_status_cubit.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  await Firebase.initializeApp();
  NotificationService.initialize(flutterLocalNotificationsPlugin,fromCurrentRequestScreen: false).then((value){
    NotificationService().requestAndRegisterNotification();
    NotificationService().createChannel(flutterLocalNotificationsPlugin);
    NotificationService().firebaseNotificaitnInit(flutterLocalNotificationsPlugin);
    NotificationService().firebaseNotificaitnOpenMessage(flutterLocalNotificationsPlugin);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  });
  HttpOverrides.global = MyHttpOverrides();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar', 'EG'),
        Locale('en', 'US'),
      ],
      path: 'assets/i18n',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<GlobalCubit>()..initApp()),
        BlocProvider(create: (context) => di.sl<LoginCubit>()),
        BlocProvider(create: (context) => di.sl<RegisterCubit>()),
        BlocProvider(create: (context) => di.sl<UpdateUserStatusCubit>()),
        BlocProvider(create: (context) => di.sl<AllUsersCubit>()..getAllUsers()),
        BlocProvider(create: (context) => di.sl<GetMessagesCubit>()),
        BlocProvider(create: (context) => di.sl<SendMessageCubit>()),
        BlocProvider(create: (context) => di.sl<TypingCubit>()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        designSize: const Size(375, 812),
        splitScreenMode: true,
        builder:(context,widget) => BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {
            if (state is AppLocaleSavedState) {
              context.setLocale(GlobalCubit.get(context).locale);
            }
          },
          builder: (context, state) {
            return MaterialApp.router(
              title: 'Wadod',
              debugShowCheckedModeBanner: false,
              locale: const Locale('en'),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: GlobalCubit.get(context).appMode,
              routerConfig: AppRouter.router,
            );
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
