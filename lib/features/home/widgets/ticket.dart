import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/app/theme/custom_text_vertical.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/home/presentation/pages/ticket_information_page.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    final double ticketHeight = ScreenUtil.heightPercentage(0.15);
    final double ticketWidth = ScreenUtil.widthPercentage(0.85);
    final double titleSized = ScreenUtil.fontSize(17);
    final double supSized = ScreenUtil.fontSize(10);
    final double textSized = ScreenUtil.fontSize(14);

    return GestureDetector(
      child: Center(
        child: SizedBox(
          height: ticketHeight,
          width: ticketWidth + 10,
          child: Stack(
            children: [
              Positioned(
                top: 11,
                left: 14,
                child: SvgPicture.asset(
                  'assets/icons/ticket_back.svg',
                  color: Colors.black.withOpacity(0.05),
                  fit: BoxFit.none,
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      'assets/icons/ticket_back.svg',
                      fit: BoxFit.none,
                    ),
                  ),
                  Positioned.fill(
                    child: SvgPicture.asset(
                      'assets/icons/ticket_top.svg',
                      color: AppColor.skyBlue,
                      fit: BoxFit.none,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: VerticalText(
                              text: "오로라",
                              fontSize: titleSized,
                              fontWeight: FontWeight.w900),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NCSText(
                                  text: "장소",
                                  fontSize: supSized,
                                  fontWeight: FontWeight.normal,
                                ),
                                NCSText(
                                  text: "4층 천체투영실",
                                  fontSize: textSized,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    NCSText(
                                      text: "시간",
                                      fontSize: supSized,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    NCSText(
                                      text: "16시",
                                      fontSize: textSized,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    NCSText(
                                      text: "인원",
                                      fontSize: supSized,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    NCSText(
                                      text: "3명",
                                      fontSize: textSized,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(width: 0,),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: RotatedBox(
                            quarterTurns: 3,
                            child: NCSText(
                              text: "천체투영실",
                              fontSize: titleSized,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              spacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Get.to(const TicketInformationPage());
      },
    );
  }
}
