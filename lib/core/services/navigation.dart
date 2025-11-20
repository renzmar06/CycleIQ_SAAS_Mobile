import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNav {
  static void to(BuildContext context, String route, {Object? extra}) {
    context.push(route, extra: extra);
  }
}
