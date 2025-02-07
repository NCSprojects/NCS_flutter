import 'package:flutter/material.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/app/theme/custom_text_style.dart';

/// 오류 메시지
void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: NCSText(text: text, fontSize: 10, fontWeight: FontWeight.w600, color:Colors.white,),
    duration: Duration(seconds: 1),
    backgroundColor: AppColor.red
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}