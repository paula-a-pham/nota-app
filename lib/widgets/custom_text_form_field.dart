import 'package:flutter/material.dart';
import 'package:nota/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String)? onChanged;
  final int maxLines;
  final double fontSize;
  final String hintText;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.maxLines,
    required this.fontSize,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: textEditingController,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field shouldn\'t be empty';
        }
        return null;
      },
      onChanged: onChanged,
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
