
// ignore_for_file: depend_on_referenced_packages

import 'package:Clot/utils/colors.dart';
import 'package:Clot/widgets/button.dart';
import 'package:Clot/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                text: 'Forgot Password',
                fontSize: 37,
                fontWeight: FontWeight.w700),
            const SizedBox(
              height: 35,
            ),
            TextFieldWidget(hintText: 'Enter Email Address', fontSize: 18),
            const Spacer(),
            MyButton(onPressed: () {}, text: 'Continue'),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
