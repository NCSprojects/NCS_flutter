import 'package:flutter/material.dart';
import 'package:ncs/features/navigation/presentation/widgets/common_bottom_nav.dart';
import 'package:ncs/features/notifications/presentation/pages/alarm_main.dart';

class NavigatorNamed {
  Map<String, Widget Function(BuildContext)> named = {

    '/home': (context) => const CommonBottomNav(),

    '/alarm': (context) => const AlarmMain(),
  };
}