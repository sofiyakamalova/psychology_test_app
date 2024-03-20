import 'package:flutter/material.dart';
import 'package:psychology_test_app/src/core/common/common_button.dart';
import 'package:psychology_test_app/src/core/common/common_text.dart';
import 'package:psychology_test_app/src/core/common/common_title.dart';
import 'package:psychology_test_app/src/core/constants/app_colors.dart';

class AnimationPage extends StatelessWidget {
  //final String image;
  AnimationPage({
    Key? key,
    /*required this.image*/
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CommonTitle(
              text: 'Вперед!',
              size: 32,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
            const CommonText(
              text: 'Ты молодец! Продолжай в том же духе! 🚀',
              size: 24,
              fontWeight: FontWeight.normal,
              color: AppColors.dark_grey_color,
            ),
            const SizedBox(height: 20),
            Image.asset('assets/images/go_ahead.png'),
            const SizedBox(height: 20),
            CommonButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: 'Продолжить'),
          ],
        ),
      ),
    );
  }
}
