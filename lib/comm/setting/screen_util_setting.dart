import 'package:flutter/material.dart';

class ScreenUtil {
  static late MediaQueryData _mediaQuery;

  static void init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
  }

  static double widthPercentage(double percentage) {
    return _mediaQuery.size.width * percentage;
  }

  static double heightPercentage(double percentage) {
    return _mediaQuery.size.height * percentage;
  }

  static double fontSize(double baseSize) {
    return _mediaQuery.size.width * baseSize / 375;
  }
}


/*
return MaterialApp(
      home: Builder(
        builder: (context) {
          ScreenUtil.init(context); // 초기화
          return HomePage();
        },
      ),
*/