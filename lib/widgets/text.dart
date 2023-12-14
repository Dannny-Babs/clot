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
      style: GoogleFonts.dmSans(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          letterSpacing: 0),
    );
  }
}

class TextFieldWidget extends StatefulWidget {
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
  // ignore: library_private_types_in_public_api
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText:
          widget.hintText == 'Password' || widget.hintText == 'Confirm Password'
              ? _obscureText
              : false,
      decoration: InputDecoration(
        suffixIcon: widget.hintText == 'Password' ||
                widget.hintText == 'Confirm Password'
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black54,
                ),
              )
            : null,
        filled: true,
        fillColor: Colors.grey[200],
        hintText: widget.hintText,
        hintStyle: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            fontFamily: GoogleFonts.dmSans().fontFamily,
            color: widget.color),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
