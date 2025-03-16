import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ncs/app/theme/custom_button.dart';
import 'package:ncs/app/theme/custom_text_style.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(flex: 1, child: SizedBox()),
          Center(
            child: Column(
              children: [
                SvgPicture.asset("assets/icons/ticket_icon.svg"),
                const SizedBox(height: 20),
                const NCSText(
                    text: "예약티켓", fontSize: 18, fontWeight: FontWeight.bold),
                const NCSText(
                    text: "5분전에 대기 부탁드립니다!",
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ],
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),

          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NCSText(text: "체험정보", fontSize: 12, fontWeight: FontWeight.w300),
              NCSText(
                  text: "이상한 신호를 찾아서",
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              SizedBox(height: 10),
              NCSText(text: "체험장소", fontSize: 12, fontWeight: FontWeight.w300),
              NCSText(
                  text: "4층 VR Room",
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              SizedBox(height: 10),
              NCSText(text: "예약시간", fontSize: 12, fontWeight: FontWeight.w300),
              NCSText(
                  text: "10시",
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              SizedBox(height: 10),
              NCSText(text: "예약인원", fontSize: 12, fontWeight: FontWeight.w300),
              NCSText(
                  text: "3명",
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              SizedBox(height: 10),
              NCSText(
                  text: "신장 120cm 미만은 안전문제로 체험이 어렵습니다.",
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ],
          ),

          const Expanded(flex: 2, child: SizedBox()),

          GestureDetector(
            onTap: (){
              print("사용하기");
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: CustomButton.customButton(
                    text: "사용하기",
                    onPressed: () {},
                    fontSize: 18,
                    borderRadius: 10),
              ),
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
        ],
      ),
    );
  }
}