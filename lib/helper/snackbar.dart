import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../index.dart';

void showSnackBarError(BuildContext context, String? message,
    [String? title, Function? onTap]) {
  Flushbar(
    titleText: Text(
      title ?? "Thất bại",
      style: medium14Text.copyWith(color:  MyColor.borderError),
    ),
    messageText: Text(
      message ?? "",
      style: medium12Text.copyWith(color: MyColor.textHint),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    borderRadius: BorderRadius.circular(12),
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    onTap: (flushBar) => {
      if (onTap != null) {onTap(), flushBar.dismiss()} else {flushBar.dismiss()}
    },
    borderWidth: 1,
    borderColor: MyColor.borderError,
    icon: const SizedBox(
      width: 36,
      height: 36,
      child:  Icon(
        Icons.error_outline,
        color: MyColor.borderError,
      ),
    ),
    backgroundColor: MyColor.bgError,
    mainButton: const Icon(
      Icons.close,
      color: MyColor.textHint,
    ),
  ).show(context);
}

void showSnackBarWarning(BuildContext context, String? message) {
  Flushbar(
    messageText: Text(
      message ?? "",
      style: medium12Text.copyWith(color:  MyColor.textWarning),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    borderRadius: BorderRadius.circular(12),
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    onTap: (flushbar) => flushbar.dismiss(),
    borderWidth: 1,
    borderColor: MyColor.borderSnackBar,
    icon: const SizedBox(
      width: 16,
      height: 16,
      child: Icon(Icons.warning),
    ),
    backgroundColor: MyColor.borderSnackBar,
  ).show(context);
}

void showSnackBarSuccess(BuildContext context, String message,
    [String? title, Function? onTap]) {
  Flushbar(
    titleText: Text(
      title ?? "Thành công",
      style: medium14Text.copyWith(color:  MyColor.success,),
    ),
    messageText: Text(
      message,
      style: medium12Text.copyWith(color: MyColor.textHint),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
    borderRadius: BorderRadius.circular(12),
    duration: const Duration(seconds: 3),
    flushbarPosition: FlushbarPosition.TOP,
    onTap: (flushBar) => {
      if (onTap != null) {onTap(), flushBar.dismiss()} else {flushBar.dismiss()}
    },
    borderWidth: 1,
    borderColor: MyColor.borderSnackBar,
    icon: const SizedBox(
      width: 36,
      height: 36,
      child:  Icon(
        Icons.tips_and_updates_outlined,
        color: MyColor.success,
      ),
    ),
    backgroundColor: MyColor.bgSuccess,
    mainButton: const Icon(
      Icons.close,
      color: MyColor.textHint,
    ),
  ).show(context);
}

void showSnackBarComingSoon(BuildContext context) {
  showSnackBarWarning(context, 'Tính năng đang phát triển');
}
