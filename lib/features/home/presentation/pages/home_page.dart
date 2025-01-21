import 'package:flutter/material.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/features/home/widgets/main_container_off.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.back,
        body: Center(child: MainContainerOff(title: '입장권',))
      ),
    );
  }
}
