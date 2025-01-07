import 'package:flutter/material.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/app/theme/custom_text_style.dart';

class CustomButton {
  static Widget customButton({
    required String text,
    required VoidCallback onPressed,
    required double fontSize,
    required double borderRadius,
    Color backgroundColor = AppColor.skyBlue,
    Color textColor = Colors.white,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: NCSText(
              text: text,
              color: textColor,
              fontSize: fontSize,
              fontWeight: fontWeight)
      ),
    );
  }
}
