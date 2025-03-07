import 'package:flutter/material.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/features/exhibits/presentation/pages/4F/infinite_swipe_view.dart';

class CosmosMain extends StatelessWidget {
  const CosmosMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.back,
        body: InfiniteSwipeExhibitView(),
      ),
    );
  }
}