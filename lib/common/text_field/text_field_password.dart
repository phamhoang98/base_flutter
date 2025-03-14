import 'package:base_flutter/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';

class TextFieldPassword extends StatefulWidget {
  TextFieldPassword({
    super.key,
    required this.hint,
    required this.text,
    this.maxLine = 1,
    this.minLine,
    this.maxLength = 250,
    this.isPassword = true,
    this.onChange,
  }) : controller = TextEditingController(text: text);

  final TextEditingController controller;
  final String? hint;
  final String  text;
  final int? maxLine, minLine, maxLength;
  final bool isPassword;
  final Function(String)? onChange;

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  late bool hidePass;

  @override
  void initState() {
    hidePass = widget.isPassword;
    super.initState();
  }

  Widget getIconRight() {
      return IconButton(
        icon: Icon(
          hidePass ? Icons.visibility_off : Icons.visibility,
          color: MyColor.textHint,
          size: 16,
        ),
        onPressed: toggleVisiblePass,
      );
  }

  void toggleVisiblePass() {
    setState(() {
      hidePass = !hidePass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        if (value) {
          widget.controller.selection =
              TextSelection.collapsed(offset: widget.controller.text.length);
        }
      },
      child: TextField(
        controller: widget.controller,
        minLines: widget.minLine,
        maxLines: widget.maxLine,
        obscureText: hidePass,
        style: small12Text.copyWith(color: MyColor.textInput),
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxLength),
        ],
        onChanged: widget.onChange,
        decoration: InputDecoration(
          hintText: widget.hint,
          suffixIcon: getIconRight(),
          hintStyle: small12Text.copyWith(
              fontWeight: FontWeight.w400, color: MyColor.textHint),
          contentPadding: const EdgeInsets.all(12),
          // isDense: true,
          filled: true,
          fillColor: MyColor.bgHind,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: MyColor.transparent,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
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
