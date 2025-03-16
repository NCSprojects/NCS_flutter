import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class TitleBackspaceAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String nameTag;
  final bool nameTagStyle;

  const TitleBackspaceAppBar({
    super.key,
    required this.title,
    this.nameTag = "",
    required this.nameTagStyle,
  });

  @override
  Size get preferredSize {
    final double calculatedHeight = ScreenUtil.heightPercentage(0.15);
    return Size.fromHeight(calculatedHeight);
  }

  @override
  Widget build(BuildContext context) {
    final double containerWidth = ScreenUtil.widthPercentage(0.2);

    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: AppColor.input,
        boxShadow: [
          BoxShadow(
            color: AppColor.lightGray.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/backspace.svg',
                fit: BoxFit.none,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          title: NCSText(
            text: title,
            color: AppColor.blue,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true, // 제목 중앙 정렬
          backgroundColor: AppColor.input,
          elevation: 0, // AppBar 자체의 그림자 제거
          scrolledUnderElevation: 0,
          actions: nameTagStyle
              ? [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  print("내용을 입력해주세요");
                },
                child: Container(
                  height: preferredSize.height * 0.25,
                  width: containerWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColor.pink,
                  ),
                  child: Center(
                    child: NCSText(
                      text: nameTag,
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ]
              : [const SizedBox()],
        ),
      ),
    );
  }
}