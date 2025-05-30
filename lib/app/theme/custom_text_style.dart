import 'package:flutter/material.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class NCSText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? maxLines; // 최대 줄 수
  final TextOverflow? overflow;
  final double? spacing;


  const NCSText({
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
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: "Pretendard",
        fontSize: ScreenUtil.fontSize(fontSize),
        fontWeight: fontWeight,
        letterSpacing: spacing,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
