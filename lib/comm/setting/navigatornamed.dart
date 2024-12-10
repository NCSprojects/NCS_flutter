import 'package:NCS/layout/home.dart';
import 'package:NCS/layout/loding.dart';
import 'package:NCS/layout/login.dart';
import 'package:NCS/layout/setting.dart';
import 'package:flutter/material.dart';

class NavigatorNamed {
  Map<String, Widget Function(BuildContext)> named = {
    // 앱 시작시 로딩 화면
    '/': (context) => const Loding(),
    // 로그인 화면
    '/login': (context) => const LogIn(),
    // 홈 화면
    '/home': (context) => const HomePage(),
    // 셋팅 화면 (임시?)
    '/setting': (context) => const Setting(),
  };
}