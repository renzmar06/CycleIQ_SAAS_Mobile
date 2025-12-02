import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNav {
  /// Push a new screen on top of current
  static void push(BuildContext context, String route, {Object? extra}) {
    context.push(route, extra: extra);
  }

  static void pop(BuildContext context) {
    context.pop();
  }

  static void delaypop(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted && context.canPop()) {
        context.pop();
      }
    });
  }

  /// Navigate without keeping previous stack
  static void go(BuildContext context, String route, {Object? extra}) {
    context.go(route, extra: extra);
  }

  /// Replace current screen with a new one
  static void replace(BuildContext context, String route, {Object? extra}) {
    context.pushReplacement(route, extra: extra);
  }

  /// Push using route name
  static void pushNamed(BuildContext context, String name, {Object? extra}) {
    context.pushNamed(name, extra: extra);
  }

  /// Go using route name
  static void goNamed(BuildContext context, String name, {Object? extra}) {
    context.goNamed(name, extra: extra);
  }

  /// Replace using route name
  static void replaceNamed(BuildContext context, String name, {Object? extra}) {
    context.pushReplacementNamed(name, extra: extra);
  }

  /// Pop a screen safely
  static void back(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else if (context.canPop()) {
      context.pop();
    }
  }

  static void safePop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  /// Clears stack and goes to new route
  static void clearAndGo(BuildContext context, String route) {
    context.go(route);
  }

  /// Push only if the route is not current
  static void pushIfNotCurrent(BuildContext context, String route) {
    final current = GoRouterState.of(context).uri.toString();
    if (current != route) {
      context.push(route);
    }
  }

  /// Open bottom sheet
  static Future<T?> bottomSheet<T>(BuildContext context, Widget child) {
    return showModalBottomSheet<T>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => child,
    );
  }

  /// Open full-screen modal
  static Future<T?> openModal<T>(BuildContext context, Widget child) {
    return Navigator.of(
      context,
    ).push(MaterialPageRoute(fullscreenDialog: true, builder: (_) => child));
  }
}
