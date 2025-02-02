import 'package:flutter/material.dart';
import 'package:ncs/app/theme/custom_button.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class ButtonBottomNav extends StatelessWidget {
  const ButtonBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final double navSize = ScreenUtil.heightPercentage(0.115);

    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory, // 클릭 효과 제거
        highlightColor: Colors.transparent, // 강조 효과 제거
      ),
      child: Container(
        height: navSize,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80, 25, 80, 25),
          child: SizedBox(
            child: CustomButton.customButton(
              text: "예약하기",
              onPressed: (){},
              fontSize: 18,
              borderRadius: 5,
            ),
          ),
        ),
      ),
    );
  }
}