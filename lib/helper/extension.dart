import 'package:flutter/material.dart';

extension ColorExtension on Color {
  get svgColorFilter {
    return ColorFilter.mode(this, BlendMode.srcIn);
  }
}

extension Navigation on BuildContext {
  void navigate({required Widget screen, Function(dynamic)? onCallBack}) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen))
        .then((value) => onCallBack?.call(value));
  }

  void popAndNavigate({
    required Widget screen,
  }) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(builder: (context) => screen),
          (Route<dynamic> route) => false,
    );
  }
}

extension StringExtension on String? {
  bool isValidEmail() {
    if (this?.trim().isEmpty ?? true) {
      return false;
    }
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this!);
  }
}