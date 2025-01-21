// import 'dart:convert';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class Loding extends StatefulWidget {
//   const Loding({Key? key}) : super(key: key);
//
//   @override
//   State<Loding> createState() => _LodingState();
// }
//
// class _LodingState extends State<Loding> {
//   // 파이어베이스 토큰
//   String _newToken = '';
//
//   // 다운로드 중인지?
//   bool isLoding = false;
//
//   double _percentage = 0.0;
//   double _percent = 0.0;
//
//   // 로그인할때 필요한 변수(Map) 선언
//   Map<String, dynamic> _paramMap = {
//     'PARAM': {
//       'user_id': '',
//       'user_pw': '',
//       'user_lang_cd': '',
//       'pagingLimit': '100',
//       'currentPage': '1'
//     }
//   };
//
//   Future<bool> _downloadFile(String url, String packageName) async {
//     List<String> splitData = url.split('/');
//     String apkName = splitData.last;
//
//     final dio = Dio();
//
//     // 권한 확인
//     if (!await Permission.storage.status.isGranted) {
//       return false;
//     }
//     if (!await Permission.requestInstallPackages.isGranted) {
//       return false;
//     }
//
//     try {
//       setState(() {
//         isLoding = true;
//       });
//       // 다운로드 경로 설정
//       final directory = await getExternalStorageDirectory();
//       final path = directory?.path ?? '/sdcard/download';
//
//       final appPath = '$path/$apkName';
//
//       // 기존 파일
//       final file = File(appPath);
//
//       // 존재 확인 후 삭제
//       if (await file.exists()) {
//         await file.delete();
//       }
//
//       final response = await dio.download(
//         url,
//         appPath,
//         onReceiveProgress: (received, total) {
//           if (total != -1) {
//             setState(() {
//               _percent = (received / total * 100);
//               _percentage = _percent / 100;
//             });
//             // print('$_percent% downloaded');
//           }
//         },
//       );
//       if (response.statusCode == 200) {
//         final result = await OpenFile.open(appPath); // 다운로드 완료 후 파일 열기
//         // 파일 열시 실패?
//         // ignore: avoid_print
//         print('OpenFile result: ${result.message}, type: ${result.type}');
//       } else {
//         // 다운로드 실패
//         await showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (context) {
//             return ShowAlertDialog(
//               title: '알림',
//               content: '다운로드에 실패했습니다.\n관리자에게 문의해 주세요.',
//               confirm: '확인',
//               onSelected: (isConfirmed) {
//                 if (isConfirmed) {
//                   // 확인
//                 }
//               },
//             );
//           },
//         );
//       }
//     } catch (e) {
//       // ignore: avoid_print
//       print('Error: $e');
//       // 오류
//       await showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) {
//           return ShowAlertDialog(
//             title: '알림',
//             content: '오류가 발생했습니다.\n관리자에게 문의해 주세요.',
//             confirm: '확인',
//             onSelected: (isConfirmed) {
//               if (isConfirmed) {
//                 exit(0);
//               }
//             },
//           );
//         },
//       );
//     }
//     return true;
//   }
//
//   // 앱 버전관리
//   Future<bool> versionChech() async {
//     // 현재 앱 버전
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     // String appName = packageInfo.appName;
//     String packageName = packageInfo.packageName;
//     String version = packageInfo.version;
//     // String buildNumber = packageInfo.buildNumber;
//
//     _paramMap['PARAM']['app_nm'] = packageName;
//
//     // 최신 앱 버전 요청
//     final requestMapString =
//     await client.getAppInfo('application/json', _paramMap);
//     Map requestMap = jsonDecode(requestMapString);
//
//     var error_code = requestMap['COMMON']['ERROR_CODE'];
//
//     if (error_code == '0000') {
//       Map map = requestMap['MAP']['rtnData'];
//       String url = '';
//
//       // 버전 비교
//       if (map['version'].toString() == version.toString()) {
//         return false;
//       } else {
//         // 업데이트 진행 여부 팝업
//         await showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (context) {
//             return ShowConfirmDialog(
//               title: '업데이트 알림',
//               content: '새로운 버전으로 업데이트하여\n개선된 기능을 이용해 주시기 바랍니다.',
//               cancel: '앱 종료',
//               confirm: '업데이트',
//               onSelected: (isConfirmed) async {
//                 // true : 확인 (앱 다운로드)
//                 // false : 취소 (앱 종료)
//                 if (isConfirmed) {
//                   if (Platform.isAndroid) {
//                     // 안드로이드 apk 다운로드
//                     url = map['apk_url'];
//                   } else if (Platform.isIOS) {
//                     // IOS ipa 다운로드
//                     url = map['ipa_url'];
//                   }
//                   if (url != '') {
//                     bool isPermission = await _downloadFile(url, packageName);
//                     if (!isPermission) {
//                       await showDialog(
//                         context: context,
//                         barrierDismissible: false,
//                         builder: (context) {
//                           return ShowAlertDialog(
//                             title: '권한',
//                             content: '필요 권한이 허용되지 않았습니다.\n권한 설정 후 다시 시도해 주세요.',
//                             confirm: '확인',
//                             onSelected: (isConfirmed) {
//                               exit(0);
//                             },
//                           );
//                         },
//                       );
//                     }
//                   } else {
//                     // 실패 메시지
//                     await showDialog(
//                       context: context,
//                       barrierDismissible: false,
//                       builder: (context) {
//                         return ShowAlertDialog(
//                           title: '오류',
//                           content: '관리자에게 문의해 주세요.',
//                           confirm: '확인',
//                           onSelected: (isConfirmed) {
//                             if (isConfirmed) {
//                               exit(0);
//                             }
//                           },
//                         );
//                       },
//                     );
//                   }
//                 } else {
//                   exit(0);
//                 }
//               },
//             );
//           },
//         );
//         return true;
//       }
//     } else if (error_code == '9999') {
//       showSnackBar(context, requestMap['COMMON']['MESSAGE_CODE']);
//       return true;
//     }
//
//     return false;
//   }
//
//   // 처음 화면 불러올때 데이터 셋팅
//   setInit() async {
//     if (await versionChech()) return;
//
//     // SecureStorage 유저정보 가져오기
//     dynamic userInfo = await SecureStorage.getUserInfo();
//
//     // SecureStorage 자동 로그인 정보 가져오기
//     dynamic autoLogin = await SecureStorage.getAutoLogin();
//
//     // 파이어베이스 토큰 정보 가져오기
//     _newToken = (await NotificationController.getToken())!;
//
//     // aotoLogin정보가 있고 user의 정보가 있다면
//     // 첫(Home) 페이지로 이동
//     if (autoLogin != null && userInfo != null) {
//       Map userInfoJson = jsonDecode(userInfo);
//
//       _paramMap = {'PARAM': userInfoJson};
//
//       saveDataSetting(_paramMap);
//
//       // 기존 파이어베이스 토큰 가져오기
//       String oldToken = await SecureStorage.getUserToken();
//
//       if (_newToken != '' && _newToken != oldToken) {
//         _paramMap['PARAM']['token'] = _newToken;
//         SecureStorage.setUserToken(_newToken);
//         client.setUserToken('application/json', _paramMap);
//       }
//
//       // 홈으로 이동
//       Navigator.pushNamedAndRemoveUntil(context, '/home_wms', (route) => false);
//     } else {
//       // 로그인 페이지로 이동
//       Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     setInit();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {
//         return onWillPop();
//       },
//       child: Scaffold(
//         body: Container(
//           color: Color(0xFF3668FF),
//           width: double.infinity,
//           height: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Center(
//                 child: SvgPicture.asset(
//                   'assets/logos/logo_wt.svg',
//                   width: 230,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: Container(
//             color: Color(0xFF3668FF),
//             height: 47,
//             child: Column(
//               children: [
//                 if (isLoding)
//                   Div.col([
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text('업데이트 진행 중 입니다. ',
//                             style:
//                             TextStyle(color: Colors.white, fontSize: 18)),
//                         Text('(${_percent.floor()}%)',
//                             style:
//                             TextStyle(color: Colors.white, fontSize: 14)),
//                       ],
//                     ),
//                     SizedBox(height: 10),
//                     LinearPercentIndicator(
//                       padding: EdgeInsets.zero,
//                       lineHeight: 10,
//                       backgroundColor: Color(0xFF3668FF),
//                       progressColor: Color(0xFFECECED),
//                       percent: _percentage,
//                     ),
//                   ]),
//               ],
//             )),
//       ),
//     );
//   }
// }