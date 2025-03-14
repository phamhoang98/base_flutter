import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const defaultReviewPerPage = 5;

const defaultAnimationDuration = Duration(milliseconds: 300);
const longAnimationDuration = Duration(milliseconds: 500);

final regularText = TextStyle(fontSize: 14.sp, fontFamily: 'Inter');

final small12Text =
    regularText.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400);

final small14Text =
    regularText.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400);

final medium12Text =
    regularText.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w500);

final medium14Text =
    regularText.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500);

final semiBold12Text = regularText.copyWith(
  fontSize: 12.sp,
  fontWeight: FontWeight.w600,
);

final semiBold14Text = regularText.copyWith(
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
);

final semiBold16Text = regularText.copyWith(
  fontSize: 16.sp,
  fontWeight: FontWeight.w600,
);

final bold14Text = regularText.copyWith(
  fontSize: 14.sp,
  fontWeight: FontWeight.bold,
);

final bold16Text = regularText.copyWith(
  fontSize: 16.sp,
  fontWeight: FontWeight.bold,
);

final bold20Text = regularText.copyWith(
  fontSize: 20.sp,
  fontWeight: FontWeight.bold,
);
