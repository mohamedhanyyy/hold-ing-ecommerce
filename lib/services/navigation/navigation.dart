import 'package:flutter/material.dart';

class AppRouter {
  static void goRoute(String routeName, {Object? arguments}) {
    Navigator.of(navigatorKey.currentContext!)
        .pushNamed(routeName, arguments: arguments);
  }

  static void goReplacement(String routeName, {Object? arguments}) {
    Navigator.of(navigatorKey.currentContext!)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  static void pop<T extends Object?>([T? result]) {
    Navigator.of(navigatorKey.currentContext!).pop(result);
  }

  static void goAndRemoveAll(String routeName, {Object? arguments}) {
    Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static final navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
}
