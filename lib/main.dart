import 'package:android_intent/android_intent.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import 'comm/setting/firebase_options.dart';
import 'comm/setting/init_controller.dart';
import 'comm/setting/navigatornamed.dart';
import 'comm/setting/notification_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 처음 앱 실행 시 권한 요청
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
  if (!await Permission.requestInstallPackages.isGranted) {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final intent = AndroidIntent(
      action: 'android.settings.MANAGE_UNKNOWN_APP_SOURCES',
      data: Uri.encodeFull('package:${packageInfo.packageName}'),
    );
    intent.launch();
  }

  // 화면 자동 회전 잠금
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  initControllers();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: NavigatorNamed().named,
    localizationsDelegates: [
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      Locale('ko', 'KR'),
      Locale('en', 'US'),
    ],
    theme: ThemeData(textTheme: GoogleFonts.notoSansTextTheme()),
    initialBinding:
    BindingsBuilder.put(() => NotificationController(), permanent: true),
  ));
}