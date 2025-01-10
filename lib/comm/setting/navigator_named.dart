import 'package:flutter/material.dart';
import 'package:ncs/features/exhibits/presentation/pages/3F/big_history_main.dart';
import 'package:ncs/features/exhibits/presentation/pages/4F/cosmos_main.dart';
import 'package:ncs/features/exhibits/presentation/pages/5F/scope_main.dart';
import 'package:ncs/features/navigation/presentation/widgets/common_bottom_nav.dart';

class NavigatorNamed {
  Map<String, Widget Function(BuildContext)> named = {

    '/home': (context) => const CommonBottomNav(),

    '/cosmos': (context) => const CosmosMain(),

    '/bigHistory': (context) => const BigMain(),

    '/scope': (context) => const ScopeMain(),

  };
}