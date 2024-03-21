import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psychology_test_app/src/core/common/common_button.dart';
import 'package:psychology_test_app/src/core/common/common_text.dart';
import 'package:psychology_test_app/src/core/common/common_title.dart';
import 'package:psychology_test_app/src/core/constants/app_colors.dart';
import 'package:psychology_test_app/src/features/tests/provider/test_provider.dart';
import 'package:psychology_test_app/src/features/tests/ui/quiz/quiz_page.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({super.key});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  bool isSelected = false;

  List<bool> isSelectedList = List.filled(9, false);

  final List<String> emotions = [
    'Хорошо 😊',
    'Усталость 😴',
    'Грусть 😢',
    'Счастливо 😄',
    'Взволнованно 😳',
    'Задумчиво 🤔',
    'Спокойно 😌',
    'Разочаровано 😞',
    'Беспокойно 😟',
  ];

  List<FilterChip> _buildFilterChips(
      QuizProvider quizProvider, BuildContext context) {
    return emotions.asMap().entries.map((entry) {
      int index = entry.key;
      String emotion = entry.value;
      return FilterChip(
        label: CommonText(
          size: 15,
          text_align: TextAlign.center,
          text: emotion,
          color: isSelectedList[index]
              ? AppColors.white_color
              : AppColors.dark_grey_color,
        ),
        selected: isSelectedList[index],
        onSelected: (bool value) {
          setState(() {
            isSelectedList[index] = value;
            quizProvider.setSelectedEmotion(emotion);
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: const BorderSide(color: Colors.transparent),
        ),
        selectedColor: AppColors.primary_color,
        showCheckmark: false,
        backgroundColor: AppColors.light_primary_color,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white_color,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const SizedBox(height: 20),
                const Center(
                  child: CommonTitle(
                    text: 'Как вы себя чувствуете?',
                    size: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/images/mood_page.png',
                    height: 302,
                  ),
                ),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 6.0,
                    runSpacing: 4.0,
                    children: _buildFilterChips(
                        Provider.of<QuizProvider>(context), context),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CommonButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuizPage()));
                    },
                    text: 'Готово',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
