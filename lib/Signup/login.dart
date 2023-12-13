import 'package:Clot/utils/colors.dart';
import 'package:Clot/widgets/button.dart';
import 'package:Clot/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            Text(
              'Sign in',
              style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.dmSans().fontFamily,
                  color: AppColors.black),
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
                TextWidget(
                  text: 'Forgot Password?',
                  fontSize: 15,
                  color: AppColors.primary,
                ),
              ],
            ),
            const Spacer(),
            MyButton(onPressed: () {}, text: 'Sign in'),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: GoogleFonts.dmSans().fontFamily,
                      color: AppColors.black),
                ),
                GestureDetector(
                    onTap: () {},
                    child: TextWidget(
                        text: 'Sign up',
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
