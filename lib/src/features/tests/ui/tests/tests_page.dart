import 'package:flutter/material.dart';
import 'package:psychology_test_app/src/core/common/common_app_bar.dart';
import 'package:psychology_test_app/src/core/common/common_text.dart';
import 'package:psychology_test_app/src/core/common/common_title.dart';
import 'package:psychology_test_app/src/core/constants/app_colors.dart';
import 'package:psychology_test_app/src/features/tests/ui/mood/mood_page.dart';

class TestsPage extends StatelessWidget {
  const TestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background_color,
        appBar: const CommonAppBar(title: 'Тесты'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MoodPage(),
                  ),
                );
                //MaterialPageRoute(builder: (context) => const QuizPage()));
              },
              child: Container(
                height: 130,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.white_color,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      child: Image.asset(
                        'assets/images/test_cover.png',
                        height: double.infinity,
                        fit: BoxFit.cover,
                        width: 111,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const CommonTitle(
                            text: 'Личный опросник ИСН',
                            size: 18,
                          ),
                          const CommonText(
                            text:
                                'помогает людям лучше понять\nсвой индивидуальный стиль',
                            size: 14,
                            text_align: TextAlign.start,
                          ),
                          Row(
                            children: <Widget>[
                              const Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.timer_sharp,
                                    color: AppColors.dark_grey_color,
                                    size: 25,
                                  ),
                                  SizedBox(width: 5),
                                  CommonText(
                                    text: '5 мин',
                                    size: 13,
                                    color: AppColors.dark_grey_color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Row(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/icons/time.png',
                                    color: AppColors.dark_grey_color,
                                    width: 20,
                                    height: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  const CommonText(
                                    text: '72 вопросов',
                                    size: 13,
                                    color: AppColors.dark_grey_color,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
