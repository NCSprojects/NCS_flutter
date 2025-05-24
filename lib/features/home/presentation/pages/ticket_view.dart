import 'package:flutter/material.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/home/widgets/ticket.dart';

class TicketView extends StatelessWidget {
  final List<Widget> tickets;

  /// 생성자에서 티켓 리스트를 받을 수 있게 변경
  const TicketView({super.key, required this.tickets});

  @override
  Widget build(BuildContext context) {
    final double containerHeight = ScreenUtil.heightPercentage(0.47);
    final double titleFont = ScreenUtil.fontSize(22);
    final double textFont = ScreenUtil.fontSize(12);

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
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          NCSText(
            text: "금일 예약하신 티켓 정보입니다.",
            fontSize: titleFont,
            fontWeight: FontWeight.bold,
            spacing: -2,
          ),
          NCSText(
            text: "입장시 티켓을 클릭 후 입장하기를 눌러주세요.",
            fontSize: textFont,
            fontWeight: FontWeight.w300,
          ),
          const SizedBox(height: 15),
          // Expanded 안에 ListView
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: tickets.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return tickets[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}