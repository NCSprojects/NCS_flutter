import 'package:flutter/material.dart';
import 'package:ncs/app/theme/custom_text_style.dart';

/// 오류 메시지
void showSnackBar(BuildContext context, String text, Color color) {
  final snackBar = SnackBar(
    content: NCSText(text: text, fontSize: 10, fontWeight: FontWeight.w600, color:Colors.white,),
    duration: const Duration(seconds: 1),
    backgroundColor: color
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}