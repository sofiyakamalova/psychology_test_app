import 'package:flutter/material.dart';
import 'package:psychology_test_app/src/core/constants/app_colors.dart';

class CommonText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final TextStyle? textStyle;
  final TextAlign? text_align;
  final double? size;

  const CommonText({
    super.key,
    required this.text,
    this.color = AppColors.black_color,
    this.fontWeight = FontWeight.normal,
    this.textStyle,
    this.text_align = TextAlign.center,
    this.size = 17.0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Nunito',
        // overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
      ),
      textAlign: text_align,
      softWrap: true,
    );
  }
}
