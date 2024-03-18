import 'package:flutter/material.dart';
import 'package:psychology_test_app/src/core/common/common_button.dart';
import 'package:psychology_test_app/src/core/common/common_text.dart';
import 'package:psychology_test_app/src/core/common/common_title.dart';
import 'package:psychology_test_app/src/core/constants/app_colors.dart';
import 'package:psychology_test_app/src/features/onboarding/data/onboarding_data.dart';
import 'package:psychology_test_app/src/features/onboarding/welcome_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final data = OnboardingData();
  final pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: data.items.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(data.items[currentIndex].image),
                        CommonTitle(
                          text: data.items[currentIndex].title,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CommonText(
                              text: data.items[currentIndex].description),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                data.items.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  width: currentIndex == index ? 30 : 7,
                  height: 7,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? AppColors.primary_color
                        : AppColors.light_grey_color,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            CommonButton(
                onTap: () {
                  setState(() {
                    if (currentIndex != data.items.length - 1) {
                      currentIndex++;
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const WelcomePage()),
                      );
                    }
                  });
                },
                text: 'Дальше'),
          ],
        ),
      ),
    );
  }
}
