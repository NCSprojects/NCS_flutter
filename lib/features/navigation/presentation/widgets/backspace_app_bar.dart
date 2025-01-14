import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class BackspaceAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackspaceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double nowonHeight = ScreenUtil.heightPercentage(0.04);
    final double arrowHeight = ScreenUtil.heightPercentage(0.002);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.lightGray.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: AppBar(
        scrolledUnderElevation: 0, //스크롤 그림자 없애기
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: SizedBox(
            height: arrowHeight,
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/backspace.svg',
                fit: BoxFit.none,
              ), onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        title: SvgPicture.asset(
          'assets/icons/nowon.svg',
          height: nowonHeight,
        ),
        centerTitle: true, // 제목 중앙 정렬
        backgroundColor: AppColor.input,
        elevation: 0, // AppBar 자체의 그림자 제거
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}