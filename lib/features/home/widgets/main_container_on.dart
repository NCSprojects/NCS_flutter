import 'package:flutter/material.dart';
import 'package:ncs/app/theme/custom_box_shadow.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class MainContainerOn extends StatelessWidget {
  const MainContainerOn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.widthPercentage(0.8),
      height: ScreenUtil.heightPercentage(0.18),
      decoration: NCSshadow.custom(
        color: Colors.white,
        borderRadius: 15,
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           NCSText(
            text: '입장 번호 입력하기',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
           NCSText(
            text: '관람권 결제 후 받은 번호 6자리를 입력하고 예약하세요.',
            fontSize: 10,
            fontWeight: FontWeight.w300,
          ),
        ],
      ),
    );
  }
}
