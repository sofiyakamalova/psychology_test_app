import 'package:flutter/material.dart';
import 'package:psychology_test_app/src/core/constants/app_colors.dart';

class CommonButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final Color border_color;
  final Color background_color;
  final Color text_color;

  const CommonButton({
    super.key,
    required this.onTap,
    required this.text,
    this.border_color = AppColors.primary_color,
    this.background_color = AppColors.primary_color,
    this.text_color = AppColors.white_color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: background_color,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: border_color,
            width: 1,
          ),
        ),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
            color: text_color,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
