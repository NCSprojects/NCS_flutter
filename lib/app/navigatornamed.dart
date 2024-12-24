import 'package:flutter/material.dart';
import 'package:ncs/features/home/presentation/pages/home_page.dart';
import 'package:ncs/features/initialization/presentation/pages/loding.dart';
import 'package:ncs/features/auth/presentation/pages/login.dart';
import 'package:ncs/features/settings/presentation/pages/setting_page.dart';

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