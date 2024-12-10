import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Map mobileInfo = {};
  String mobileId = '';
  String mobileModel = '';

  setInit() async {
    mobileInfo = await getMobileInfo();
    setState(() {
      mobileId = mobileInfo['id'].toString();
      mobileModel = mobileInfo['model'].toString();
    });
  }

  @override
  void initState() {
    super.initState();

    setInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appBar: AppBar()),
      endDrawer: BaseDrawer(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Text('현재 접속 기기: $mobileModel'),
            Text('ID: $mobileId'),
          ],
        ),
      ),
    );
  }
}