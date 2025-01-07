import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/exhibits/presentation/widgets/exhibit_container.dart';

void main() {
  runApp(
    Builder(builder: (context) {
      ScreenUtil.init(context); // 초기화
      WidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp();
      return const CosmosMain();
    }),
  );
}

class CosmosMain extends StatelessWidget {
  const CosmosMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: AppColor.back,
        body: Center(child: ExhibitContainer(title: "이야",)),
      ),
    );
  }
}
