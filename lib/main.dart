import 'package:Clot/Signup/Onboarding%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
            home: const OnboardingPage(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: const Color(0xFF8E6CEF),
              useMaterial3: true,
              fontFamily: GoogleFonts.dmSans().fontFamily,
              textTheme: GoogleFonts.dmSansTextTheme(),
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(
                primary: const Color(0xFF8E6CEF),            
              ), 
                            
            ),
    );
  }
}
