// import 'package:android_intent_plus/android_intent.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:get/get_instance/src/bindings_interface.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:ncs/core/services/firebase/firebase_options.dart';
// import 'package:ncs/features/notifications/presentation/controllers/notification_controller.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import 'comm/setting/init_controller.dart';
// import 'comm/setting/navigator_named.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   // 처음 앱 실행 시 권한 요청
//   var status = await Permission.storage.status;
//   if (!status.isGranted) {
//     await Permission.storage.request();
//   }
//   if (!await Permission.requestInstallPackages.isGranted) {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     final intent = AndroidIntent(
//       action: 'android.settings.MANAGE_UNKNOWN_APP_SOURCES',
//       data: Uri.encodeFull('package:${packageInfo.packageName}'),
//     );
//     intent.launch();
//   }
//
//   //화면 자동 회전 잠금
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//
//   initControllers();
//   runApp(GetMaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: '/',
//     routes: NavigatorNamed().named,
//     localizationsDelegates: const [
//       GlobalCupertinoLocalizations.delegate,
//       GlobalMaterialLocalizations.delegate,
//       GlobalWidgetsLocalizations.delegate,
//     ],
//     supportedLocales: const [
//       Locale('ko', 'KR'),
//       Locale('en', 'US'),
//     ],
//     initialBinding:
//     BindingsBuilder.put(() => NotificationController(), permanent: true),
//   ));
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ncs/comm/setting/navigator_named.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/navigation/presentation/bloc/bottom_navigation_cubit.dart';

void main() {
  runApp(
    Builder(builder: (context) {
      ScreenUtil.init(context); // 초기화
      WidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp();
      return const MyApp();
    }),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: GetMaterialApp(
        title: 'NCS-Project',
        initialRoute: '/home',
        routes: NavigatorNamed().named,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}