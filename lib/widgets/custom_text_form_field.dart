import 'package:flutter/material.dart';
import 'package:nota/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final int maxLines;
  final double fontSize;
  final String hintText;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.maxLines,
    required this.fontSize,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field shouldn\'t be empty';
        }
        return null;
      },
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: fontSize),
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: fontSize),
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
    );
  }
}
