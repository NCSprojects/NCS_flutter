import 'package:flutter/material.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class CustomNumInput {
  static Widget numberInputField({
    required BuildContext context,
    required TextEditingController controller,
    required String text,
    required double fontSize,
    required FontWeight fontWeight,
    String? Function(String?)? validator,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.all(8.0),
    Color borderColor = Colors.transparent,
    Color backgroundColor = AppColor.input,
    required void Function(String inputText) onChanged,

  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: ScreenUtil.fontSize(fontSize),
        color: AppColor.blue,
        fontWeight: fontWeight,
      ),
      decoration: InputDecoration(
        label: Center(
          child: NCSText(
            text: text,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: AppColor.lightGray,
          ),
        ),
        filled: true,
        fillColor: backgroundColor,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: borderColor, width: 0.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: borderColor, width: 0.2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: borderColor, width: 0.2),
        ),
      ),
      validator: validator
    );
  }
}