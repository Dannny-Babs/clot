// ignore_for_file: must_be_immutable

import 'package:Clot/utils/colors.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color = AppColors.primary,
    this.textColor = AppColors.white,
    this.fontSize = 18,
  });
  final VoidCallback onPressed;
  final String text;
  Color color;
  Color textColor;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
