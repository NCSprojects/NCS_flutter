import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/app/theme/custom_box_shadow.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class ExhibitCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const ExhibitCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = ScreenUtil.widthPercentage(0.6);
    final double cardHeight = ScreenUtil.heightPercentage(0.41);
    final double titleSize = ScreenUtil.fontSize(18);
    final double textSize = ScreenUtil.fontSize(12);

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: NCSshadow.custom(
        color: Colors.white,
        borderRadius: 15,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 15,),
            NCSText(
              text: title,
              fontSize: titleSize,
              fontWeight: FontWeight.w600,
              color: AppColor.blue,
            ),
            SvgPicture.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            NCSText(
              text: description,
              fontSize: textSize,
              fontWeight: FontWeight.w400,
              color: AppColor.blue,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}