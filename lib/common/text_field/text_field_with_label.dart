import 'package:flutter/material.dart';

import '../../index.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    super.key,
    required this.label,
    this.text,
    this.hint,
    this.isPassword = false,
    this.isOnlyNumber = false,
    this.isReadOnly = false,
    required this.onChange,
  });

  final String label;
  final String? text;
  final String? hint;
  final bool isPassword;
  final bool isOnlyNumber;
  final bool isReadOnly;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: NormalText(
              text: label,
              color: MyColor.textLabel,
              fontWeight: FontWeight.w400,
            )),
        const SizedBox(
          height: 8,
        ),
        isPassword
            ? TextFieldPassword(
                hint: hint,
                text: text ?? '',
                onChange: onChange,
              )
            : TextFieldCustom(
                hint: hint,
                text: text ?? '',
                onChange: onChange,
                isReadOnly: isReadOnly,
                isOnlyNumber: isOnlyNumber,
              )
      ],
    );
  }
}
