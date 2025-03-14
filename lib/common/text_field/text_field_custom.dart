import 'package:base_flutter/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom({
    super.key,
    this.hint,
    required this.text,
    this.maxLine = 1,
    this.minLine,
    this.maxLength = 250,
    this.isReadOnly = false,
    this.isOnlyNumber = false,

    this.onChange,
  }) : controller = TextEditingController(text: text);

  final TextEditingController controller;
  final String? hint;
  final String  text;
  final int? maxLine, minLine, maxLength;
  final bool isReadOnly;
  final bool isOnlyNumber;
  final Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        if (value) {
          controller.selection =
              TextSelection.collapsed(offset: controller.text.length);
        }
      },
      child: TextField(
        controller: controller,
        minLines: minLine,
        maxLines: maxLine,
        readOnly: isReadOnly,
        keyboardType: isOnlyNumber ? TextInputType.number : null,
        focusNode: isReadOnly ? AlwaysDisabledFocusNode() : null,
        style: small12Text.copyWith(
            color: isReadOnly ? MyColor.textHint : MyColor.textInput),
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: small12Text.copyWith(
              fontWeight: FontWeight.w400, color: MyColor.textHint),
          contentPadding: const EdgeInsets.all(12),
          // isDense: true,
          filled: true,
          fillColor: MyColor.bgHind,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: MyColor.transparent,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: MyColor.transparent,
              width: 1,
            ),
          ),
          // minHeight: 60.0,
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
