import 'package:flutter/material.dart';
import 'package:psychology_test_app/src/core/constants/app_colors.dart';

class CommonButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const CommonButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.primary_color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            color: AppColors.white_color,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
