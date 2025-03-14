import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants/constants.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
        size: 30.sp,
        itemBuilder: (context, index) {
          return Container(
            height: 30.sp,
            width: 5.sp,
            decoration: BoxDecoration(
              color: MyColor.primary,
              borderRadius: BorderRadius.circular(
                4.sp,
              ),
            ),
          );
        });
  }
}
