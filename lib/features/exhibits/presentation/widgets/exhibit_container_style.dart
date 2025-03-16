import 'package:flutter/material.dart';
import 'package:ncs/app/theme/custom_box_shadow.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class ExhibitContainerStyle extends StatelessWidget {
  const ExhibitContainerStyle({
    super.key,
    required this.title,
    required this.date,
    required this.description,
    required this.mainText,
    required this.subText,
    required this.imagePath,
  });

  final String title;
  final String date;
  final String description;
  final String mainText;
  final String subText;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    final double containerWidth = ScreenUtil.widthPercentage(0.9);
    final double containerHeight = ScreenUtil.heightPercentage(0.2);
    final double baseSize =
    containerWidth < containerHeight ? containerWidth : containerHeight;
    final double a4Width = (baseSize - 20) * 0.6;
    final double a4Height = a4Width * (297 / 210);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: containerWidth,
        height: containerHeight,
        decoration: NCSshadow.custom(
          color: Colors.white,
          borderRadius: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NCSText(
                  text: date, // 날짜
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 2),
                SizedBox(
                  width: a4Width,
                  height: a4Height,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NCSText(
                        text: title, // 큰 제목
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      NCSText(
                        text: description, // 간단 설명
                        fontSize: 8,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NCSText(
                        text: mainText, // 메인 텍스트
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      NCSText(
                        text: subText, // 서브 텍스트
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
