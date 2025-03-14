import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySizeBox extends StatelessWidget {
  const MySizeBox({super.key, this.height = 0, this.width = 0});

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.spMin, width: width.spMin);
  }
}
