import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigatorService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext currentContext() {
    return navigatorKey.currentContext!;
  }

  static Future<dynamic> pushNamed(String routeName,
      {dynamic arguments}) async {
    final path = routeName;
    print("arguments$arguments");

    return GoRouter.of(navigatorKey.currentContext!).pushNamed(
      routeName,
      extra: arguments,
    );
  }

  static Future<dynamic> pushNamedWithParams(String routeName,
      {required Map<String, String> params}) async {
    while (GoRouter.of(navigatorKey.currentContext!).canPop()) {
      GoRouter.of(navigatorKey.currentContext!).pop();
    }
    return GoRouter.of(navigatorKey.currentContext!).pushReplacementNamed(
      routeName,
      pathParameters: params,
    );
  }

  static Future<dynamic> pushReplacementNamed(String routeName,
      {dynamic arguments}) async {
    final path = routeName;
    print("arguments$arguments");

    return GoRouter.of(navigatorKey.currentContext!).pushReplacementNamed(
      routeName,
      extra: arguments,
    );
  }

  static void pop({dynamic result}) {
    return GoRouter.of(navigatorKey.currentContext!).pop(result);
  }

  static bool canPop() {
    return GoRouter.of(navigatorKey.currentContext!).canPop();
  }

  static void popAll() {
    while (GoRouter.of(navigatorKey.currentContext!).canPop()) {
      GoRouter.of(navigatorKey.currentContext!).pop();
    }
  }

  static Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {bool routePredicate = false, dynamic arguments}) async {
    while (GoRouter.of(navigatorKey.currentContext!).canPop()) {
      GoRouter.of(navigatorKey.currentContext!).pop();
    }
    GoRouter.of(navigatorKey.currentContext!)
        .pushReplacementNamed(routeName, extra: arguments);
  }

  static Future<dynamic> popAllAndPush(String routeName,
      {bool routePredicate = false, dynamic arguments}) async {
    while (GoRouter.of(navigatorKey.currentContext!).canPop()) {
      GoRouter.of(navigatorKey.currentContext!).pop();
    }
    GoRouter.of(navigatorKey.currentContext!).push(routeName);
  }

  static Future<dynamic> popAndPushNamed(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.popAndPushNamed(routeName, arguments: arguments);
  }

  static String _buildPathParams(params) {
    final List<String> paramList = [];
    params.forEach((key, value) {
      paramList.add('$key/$value');
    });
    return paramList.join('/');
  }
}
