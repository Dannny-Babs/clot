// ignore_for_file: depend_on_referenced_packages

import 'package:Clot/utils/colors.dart';
import 'package:Clot/widgets/button.dart';
import 'package:Clot/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(60),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Ionicons.chevron_back,
                  color: AppColors.black,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextWidget(
                text: 'Create Account',
                fontSize: 37,
                fontWeight: FontWeight.w700),
            const SizedBox(
              height: 40,
            ),
            TextFieldWidget(hintText: 'Firstname', fontSize: 18),
            const SizedBox(
              height: 12.5,
            ),
            TextFieldWidget(hintText: 'Lastname', fontSize: 18),
            const SizedBox(
              height: 12.5,
            ),
            TextFieldWidget(hintText: 'Email Address', fontSize: 18),
            const SizedBox(
              height: 12.5,
            ),
            TextFieldWidget(hintText: 'Password', fontSize: 18),
            const SizedBox(
              height: 12.5,
            ),
            TextFieldWidget(hintText: 'Confirm Password', fontSize: 18),
            const Spacer(),
            MyButton(onPressed: () {}, text: 'Continue'),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.dmSans().fontFamily,
                      color: AppColors.black),
                ),
                GestureDetector(
                    onTap: () {},
                    child: TextWidget(
                        text: 'Login',
                        fontSize: 16,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ],
        ),
      ),
    );
  ;
  }
}