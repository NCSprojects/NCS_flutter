import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class ExhibitGuidArrow extends StatelessWidget {
  const ExhibitGuidArrow({super.key});

  @override
  Widget build(BuildContext context) {
    final double fontSize = ScreenUtil.fontSize(12);
    return Column(
      children: [
        SvgPicture.asset(
          "assets/icons/arrow.svg",
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10),
        NCSText(
          text: "좌우로 스크롤 해주세요!",
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
          color: AppColor.blue,
        ),
      ],
    );
  }
}
