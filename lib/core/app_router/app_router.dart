import 'package:flutter_educatly_task/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_educatly_task/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter_educatly_task/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter_educatly_task/features/chats/presentation/screens/chat_screen.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import 'navigate_services.dart';
import 'screen_routes.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    navigatorKey: NavigatorService.navigatorKey,
    initialLocation: AppRouterNames.splashScreen,
    routes: [
      GoRoute(
        path: AppRouterNames.splashScreen,
        name: AppRouterNames.splashScreen,
        builder: (_, __) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.loginRoute,
        name: AppRouterNames.loginRoute,
        builder: (_, __) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.registerRoute,
        name: AppRouterNames.registerRoute,
        builder: (_, __) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.homeRoute,
        name: AppRouterNames.homeRoute,
        builder: (_, __) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.chatRoute,
        name: AppRouterNames.chatRoute,
        builder: (_, __) {
          return const ChatScreen();
        },
      ),
    ],
  );
}
