import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../index.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    Key? key,
    required this.text,
    required this.onPressed,
    this.svgName,
    this.width,
    this.maxWidth = false,
    this.borderColor,
    this.textColor,
    this.iconColor,
    this.height,
    this.textHeight,
    this.fontWeight,
    this.fontSize,
    this.sizeIcon,
    this.paddingButton,
    this.color,
    this.maxWithText,
    this.borderRadius = 8,
  }) : super(key: key);
  final String text;
  final String? svgName;
  final Function() onPressed;
  final double? width, height, fontSize, textHeight;
  final bool maxWidth;
  final Color? borderColor, textColor, color, iconColor;
  final FontWeight? fontWeight;
  final double? sizeIcon;
  final double borderRadius;
  final EdgeInsets? paddingButton;
  final double? maxWithText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: maxWidth ? double.maxFinite : width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: paddingButton ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
          backgroundColor: color ?? MyColor.primary,
          foregroundColor: textColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            svgName != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/$svgName',
                        height: sizeIcon ?? 24.spMin,
                        width: sizeIcon ?? 24.spMin,
                        colorFilter:
                            (iconColor ?? MyColor.white).svgColorFilter,
                      ),
                      const MySizeBox(
                        width: 8,
                      )
                    ],
                  )
                : Container(),
            Container(
              constraints:
                  BoxConstraints(maxWidth: maxWithText ?? double.infinity),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor ?? MyColor.white,
                    fontWeight: fontWeight ?? FontWeight.w400,
                    fontSize: fontSize ?? 16.spMin,
                    height: textHeight),
              ),
            )
          ],
        ),
      ),
    );
  }
}
