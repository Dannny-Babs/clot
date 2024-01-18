// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:Clot/utils/colors.dart';
import 'package:Clot/widgets/button.dart';
import 'package:Clot/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:ionicons/ionicons.dart';

import '../Home screens/homescreen.dart';
import 'signUp.dart';
import 'forgotpassword.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/clot.png',
                width: 80,
                height: 80,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextWidget(text: 'Sign In', fontSize: 45),
            TextWidget(
              text: 'Sign in to continue your shopping experience ',
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
            const SizedBox(
              height: 50,
            ),
            TextFieldWidget(hintText: 'Email Address', fontSize: 18),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidget(hintText: 'Password', fontSize: 18),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen()),
                    );
                  },
                  child: TextWidget(
                    text: 'Forgot Password?',
                    fontSize: 15,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const Spacer(),
            MyButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homescreen()),
                  );
                },
                text: 'Sign in'),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.dmSans().fontFamily,
                      color: AppColors.black),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: TextWidget(
                        text: ' Sign up',
                        fontSize: 16,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
