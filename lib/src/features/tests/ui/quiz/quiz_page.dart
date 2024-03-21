import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psychology_test_app/src/core/common/common_app_bar.dart';
import 'package:psychology_test_app/src/core/common/common_button.dart';
import 'package:psychology_test_app/src/core/common/common_text.dart';
import 'package:psychology_test_app/src/core/common/common_title.dart';
import 'package:psychology_test_app/src/core/constants/app_colors.dart';
import 'package:psychology_test_app/src/features/tests/components/progress_dot_widget.dart';
import 'package:psychology_test_app/src/features/tests/models/question_tracker.dart';
import 'package:psychology_test_app/src/features/tests/provider/test_provider.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CommonAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'Личный опросник ИСН',
          height: 65,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.primary_color,
          ),
          background_color: AppColors.white_color,
          text_color: AppColors.primary_color,
        ),
        backgroundColor: AppColors.white_color,
        body: ChangeNotifierProvider(
          create: (_) => QuizProvider(context),
          child: Consumer<QuizProvider>(
            builder: (context, provider, child) {
              QuestionTracker progressTracker =
                  QuestionTracker(provider.questions);
              progressTracker.updateProgress(provider.currentIndex);
              // Scroll to the current index
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                _scrollToCurrentIndex(provider.currentIndex);
              });
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CommonTitle(
                              size: 18,
                              text:
                                  'Вопрос ${provider.currentIndex + 1} из 74'),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: CommonButton(
                              onTap: provider.previousQuestion,
                              text: ('Пред. вопрос'),
                              border_color: AppColors.primary_color,
                              text_color: AppColors.primary_color,
                              background_color: AppColors.white_color,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.questions.length,
                        controller: _controller,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ProgressDotWidget(
                              status: provider.questions[index].status,
                              index: index + 1,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: ListView.builder(
                        itemCount: provider.questions.length,
                        itemBuilder: (context, index) {
                          return Visibility(
                            visible: provider.currentIndex == index,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.maxFinite,
                                  height: 100,
                                  child: CommonText(
                                    maxLines: 5,
                                    text:
                                        '${provider.currentIndex + 1}. ${provider.questions[index].questionText}',
                                    size: 18,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.dark_grey_color,
                                    text_align: TextAlign.start,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CommonButton(
                                        onTap: provider.testSubmitted
                                            ? null
                                            : () {
                                                provider.answerQuestion('No');
                                              },
                                        text: ('Нет'),
                                        border_color: AppColors.primary_color,
                                        text_color: AppColors.primary_color,
                                        background_color: AppColors.white_color,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: CommonButton(
                                        onTap: provider.testSubmitted
                                            ? null
                                            : () {
                                                provider.answerQuestion('Yes');
                                              },
                                        text: ('Да'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _scrollToCurrentIndex(int currentIndex) {
    _controller.animateTo(
      currentIndex * 50.0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }
}
