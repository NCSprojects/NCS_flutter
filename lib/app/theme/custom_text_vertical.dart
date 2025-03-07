import 'package:flutter/material.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/app/theme/custom_text_style.dart';

class VerticalText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? maxLines; // 최대 줄 수
  final TextOverflow? overflow;
  final double? spacing;


  const VerticalText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    this.color = AppColor.blue,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.spacing,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: text.split("").map((char) => NCSText(text: char, fontSize: fontSize, fontWeight: fontWeight,)).toList(),
    );
  }
}