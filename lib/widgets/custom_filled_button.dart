import 'package:flutter/material.dart';
import 'package:nota/constants/colors.dart';

class CustomFilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const CustomFilledButton({
    super.key,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
          backgroundColor: kPrimaryColor, foregroundColor: Colors.white),
      child: Text(title),
    );
  }
}
