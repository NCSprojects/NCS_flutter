import 'package:flutter/material.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/reservations/presentation/widget/counter_widget.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double titleSize = ScreenUtil.fontSize(18);
    final double groupSize = ScreenUtil.fontSize(16);
    final double exSize = ScreenUtil.fontSize(10);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          NCSText(
            text: "예약하기",
            fontSize: titleSize,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NCSText(
                    text: "보호자",
                    fontSize: groupSize,
                    fontWeight: FontWeight.w600,
                  ),
                  NCSText(
                    text: "성인부터 보호자로 들어갑니다.",
                    fontSize: exSize,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
              const CounterWidget(type: "guardian"),
            ],
          ),
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NCSText(
                    text: "청소년",
                    fontSize: groupSize,
                    fontWeight: FontWeight.w600,
                  ),
                  NCSText(
                    text: "만 20세 미만 체험자들은 청소년으로 들어갑니다. ",
                    fontSize: exSize,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
              const CounterWidget(type: "participant"),
            ],
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
