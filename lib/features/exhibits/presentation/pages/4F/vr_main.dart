import 'package:flutter/material.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/features/exhibits/presentation/widgets/exhibit_container_button.dart';

class VrMain extends StatelessWidget {
  const VrMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.back,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              ExhibitContainerButton(
                imagePath: 'assets/images/science.png',
                title: '과학 누리 탐험', // 큰 제목
                duration: '기간: 11/07~11/13', // 날짜
                description: '매주 다른 내용으로 과학을 공부해요!', // 간단 설명
                mainText: '우리 해시계에 대해 알아봐요!', // 메인 텍스트
                subText: '해시계에 대해 알아보고 간단한 만들기 체험', // 서브 텍스트
              ),
              ExhibitContainerButton(
                imagePath: 'assets/images/special_exhibition.png',
                title: '특별 전시회', // 큰 제목
                duration: '기간: 11/07~11/19', // 날짜
                description: '전시회가 준비되어 있습니다.', // 간단 설명
                mainText: '천문 동아리: 노원중학교', // 메인 텍스트
                subText: '천문동아리에서 실시한 특별 전시회!', // 서브 텍스트
              ),
              ExhibitContainerButton(
                imagePath: 'assets/images/vacation_workshop.png',
                title: '방학 특강', // 큰 제목
                duration: '기간: 07/07~07/21', // 날짜
                description: '방학기간에 진행되는 특강이 준비되어있습니다!', // 간단 설명
                mainText: '보글보글 화산공부!', // 메인 텍스트
                subText: '보글보글 끓는 화산에는 어떤 과학이 숨어있을까?', // 서브 텍스트
              ),
            ],
          ),
        ),
      ),
    );
  }
}
