import 'package:flutter/material.dart';
import 'package:ncs/app/theme/custom_box_shadow.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class ExhibitContainer extends StatelessWidget {
  const ExhibitContainer({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final double containerWidth = ScreenUtil.widthPercentage(0.8);
    final double containerHeight = ScreenUtil.heightPercentage(0.2);
    final double baseSize =
        containerWidth < containerHeight ? containerWidth : containerHeight;
    final double a4Width = (baseSize - 20) * 0.6;
    final double a4Height = a4Width * (297 / 210);

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: NCSshadow.custom(
        color: Colors.white,
        borderRadius: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const NCSText(
                text: '기간: 11/07 ~ 11/13',
                fontSize: 8,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 2,),
              Container(
                width: a4Width,
                height: a4Height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red
                ),
              ),
            ],
          ),
          const SizedBox(width: 10,),
          const Padding(
            padding: EdgeInsets.fromLTRB(0,25,0,15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NCSText(
                      text: '과학 누리 탐험',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    NCSText(
                      text: '매주 다른 내용으로 과학을 공부해요!',
                      fontSize: 8,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NCSText(
                      text: '우리 해시계에 대해 알아봐요!',
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                    NCSText(
                      text: '해시계에 대해 알아보고 간단한 만들기 체험',
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
