// ignore: file_names
import 'package:Clot/Signup%20Screens/Login.dart';
import 'package:Clot/utils/colors.dart';
import 'package:Clot/utils/onboarding_text.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int CurrentIndex = 0;
  PageController _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: CurrentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Image.asset(
              alignment: Alignment.center,
              'assets/images/clot.png',
              fit: BoxFit.fitHeight,
              height: 20,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  CurrentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/Onboarding${index + 1}.png'),
                        fit: BoxFit.cover,
                      ),
                    ));
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          3,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 5),
                            height: 10,
                            width: CurrentIndex == index ? 30 : 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: CurrentIndex == index
                                  ? Colors.deepPurple
                                  : Colors.deepPurple.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        onboardingScreens[CurrentIndex]['title']!,
                        style: GoogleFonts.dmSans(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        onboardingScreens[CurrentIndex]['description']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (CurrentIndex == 3 - 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                            } else {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.easeInOutQuint);
                            }
                          },
                          child: Text(
                            CurrentIndex == 3 - 1 ? 'Get Started' : 'Continue',
                            style: TextStyle(
                                color: AppColors.white,
                                fontFamily: GoogleFonts.dmSans().fontFamily,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
