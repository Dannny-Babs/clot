// ignore_for_file: must_be_immutable

import 'package:Clot/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  TextWidget(
      {super.key,
      required this.text,
      required this.fontSize,
      this.fontWeight = FontWeight.bold,
      this.color = AppColors.black});
  late String text;
  late double fontSize;
  FontWeight fontWeight;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: GoogleFonts.dmSans().fontFamily,
          color: color),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.fontSize,
      this.fontWeight = FontWeight.w400,
      this.color = Colors.black45});
  late String hintText;
  late double fontSize;
  late FontWeight fontWeight;
  late Color color;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        
        filled: true,
        fillColor: Colors.grey[200],
        hintText: hintText,
        hintStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.dmSans().fontFamily,
            color: color),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
