// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:Clot/Home%20screens/homescreen.dart';
import 'package:Clot/utils/colors.dart';
import 'package:Clot/widgets/button.dart';
import 'package:Clot/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import 'Login.dart';

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
            MyButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SetupScreen()),
                  );
                },
                text: 'Continue'),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
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
  }
}

const List<Widget> gender = <Widget>[
  Text('Men'),
  Text('Women'),
];

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  final List<bool> _selectedGender = <bool>[true, false];
  String _selectedAgeRange = 'Age Range'; // Default selected age range

  List<String> ageRanges = [
    'Age Range',
    '18-24',
    '25-34',
    '35-44',
    '45-54',
    '55-64',
    '65+',
  ];
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
            TextWidget(
                text: 'Tell us About Yourself',
                fontSize: 32,
                fontWeight: FontWeight.w800),
            const SizedBox(
              height: 40,
            ),
            TextWidget(
              text: 'Who do you shop for?',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 10,
            ),
            ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  // The button that is tapped is set to true, and the others to false.
                  for (int i = 0; i < _selectedGender.length; i++) {
                    _selectedGender[i] = i == index;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              selectedBorderColor: AppColors.primary,
              selectedColor: AppColors.white,
              fillColor: AppColors.primary,
              color: AppColors.black,
              constraints: BoxConstraints(
                minHeight: 50.0,
                minWidth: MediaQuery.of(context).size.width / 2 - 30,
              ),
              isSelected: _selectedGender,
              children: gender,
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: 'How old are you?',
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.grey,
              ),
              child: DropdownButton<String>(
                value: _selectedAgeRange,
                icon: const Icon(
                  Ionicons.chevron_down,
                  color: AppColors.black,
                ),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.dmSans().fontFamily,
                    color: AppColors.black),
                dropdownColor: AppColors.white,
                isExpanded: true,
                underline: const SizedBox(),
                elevation: 2,
                borderRadius: BorderRadius.circular(30),
                menuMaxHeight: 300,
                iconSize: 20,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedAgeRange = newValue!;
                  });
                },
                items: ageRanges.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            MyButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homescreen()),
                  );
                },
                text: 'Continue'),
            const SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
