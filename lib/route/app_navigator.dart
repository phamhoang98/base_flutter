import 'package:flutter/material.dart';

class AppNavigator {
  static MaterialPageRoute push(Widget page, {RouteSettings? settings}) {
    return MaterialPageRoute(
        settings: settings,
        builder: (context) {
          return page;
        });
  }
}
