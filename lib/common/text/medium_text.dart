import 'package:base_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class MediumText extends StatelessWidget {
  const MediumText({
    super.key,
    required this.text,
    this.color = MyColor.primary,
    this.fontWeight = FontWeight.bold,
    this.height,
    this.overflow,
    this.maxLine,
    this.textAlign,
    this.decoration,
  });

  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double? height;
  final TextOverflow? overflow;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow,
        maxLines: maxLine,
        textAlign: textAlign,
        style: bold16Text.copyWith(
          color: color,
          fontWeight: fontWeight,
          height: height,
          decoration: decoration,
        ));
  }
}
