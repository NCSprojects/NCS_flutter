import 'package:flutter/material.dart';
import 'package:ncs/app/theme/custom_box_shadow.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class MainContainerOn extends StatelessWidget {
  final int visitors;
  const MainContainerOn({super.key,
    required this.visitors});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: ScreenUtil.widthPercentage(0.8),
      height: ScreenUtil.heightPercentage(0.18),
      decoration: NCSshadow.custom(
        color: Colors.white,
        borderRadius: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Column(
            children: [
              NCSText(
                text: '방문하신 여러분 환영합니다.',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              NCSText(
                text: '하단을 참고하여 프로그램을 확인해주세요!',
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
          NCSText(
            text: '${visitors ?? "N"}명으로 예약하셨습니다.',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
