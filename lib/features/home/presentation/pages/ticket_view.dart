import 'package:flutter/material.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/home/widgets/ticket.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final double containerHeight = ScreenUtil.heightPercentage(0.51);
    final double titleFont = ScreenUtil.fontSize(22);
    final double textFont = ScreenUtil.fontSize(14);
    return Container(
      height: containerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -4),
          )
        ]
      ),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          NCSText(text: "금일 예약하신 티켓 정보입니다.", fontSize: titleFont, fontWeight: FontWeight.bold,spacing: -2),
          NCSText(text: "입장시 티켓을 클릭 후 입장하기를 눌러주세요.", fontSize: textFont, fontWeight: FontWeight.w300),
          const SizedBox(height: 15,),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Ticket(),
                  Ticket(),
                  Ticket(),
                  Ticket(),
                  Ticket(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
