import 'package:flutter/material.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/features/exhibits/presentation/widgets/exhibit_container.dart';

class ScopeMain extends StatelessWidget {
  const ScopeMain({super.key});

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
              SizedBox(height: 15,),
              ExhibitContainer(
                imagePath: 'assets/images/sun.png',
                title: '태양 관측', // 큰 제목
                date: '체험시간: 25~30분', // 날짜
                description: '태양을 두눈으로 관측해요!', // 간단 설명
                mainText: '기상 악화시 대체 프로그램으로 진행됩니다!', // 메인 텍스트
                subText: '주의사항...', // 서브 텍스트
              ),
              ExhibitContainer(
                imagePath: 'assets/images/night.png',
                title: '야간 관측', // 큰 제목
                date: '체험시간: 30~50분', // 날짜
                description: '토성, 목성, 천체등을 관측해요', // 간단 설명
                mainText: '홈페이지로 예약해요', // 메인 텍스트
                subText: '주의사항..', // 서브 텍스트
              ),
            ],
          ),
        ),
      ),
    );
  }
}
