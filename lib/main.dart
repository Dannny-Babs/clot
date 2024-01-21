// ignore_for_file: dead_code

import 'package:clot/Signup%20Screens/Onboarding%20Screen.dart';
import 'package:clot/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.dmSans().fontFamily,
        textTheme: GoogleFonts.dmSansTextTheme(),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(
              primary: const Color(0xFF8E6CEF),
            )
            .copyWith(background: Colors.white),
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      
      home: const OnboardingPage(),
    );
  }
}

