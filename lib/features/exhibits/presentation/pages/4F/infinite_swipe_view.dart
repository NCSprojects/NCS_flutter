import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/exhibits/presentation/bloc/swipe_cubit.dart';
import 'package:ncs/features/exhibits/presentation/widgets/exhibit_card.dart';
import 'package:ncs/features/exhibits/presentation/widgets/exhibit_guid_arrow.dart';


class InfiniteSwipeExhibitView extends StatelessWidget {
  final PageController _pageController = PageController(
    initialPage: 1000,
    viewportFraction: 0.6,
  );

  InfiniteSwipeExhibitView({super.key});

  @override
  Widget build(BuildContext context) {
    final double heightSize = ScreenUtil.heightPercentage(0.45);
    final List<Widget> exhibitCards = [
      const Padding(
        padding: EdgeInsets.all(10.0),
        child: ExhibitCard(
          imagePath: 'assets/icons/VR.svg',
          title: "외계행성으로 떠나요!",
          description: "VR로 진행되는 우주선 탐험 OX퀴즈와  우주쓰레기를 청소해요!",
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(10.0),
        child: ExhibitCard(
          imagePath: 'assets/icons/Video.svg',
          title: "누워서 보는 영화관!",
          description: "천체투영실에서 누워서 영화를 관람해요!\n",
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(10.0),
        child: ExhibitCard(
          imagePath: "assets/icons/Constellation_story.svg",
          title: "별자리 해설",
          description: "계절 별자리는 어떤게 있을까? 우리 같이 알아보아요!",
        ),
      ),
    ];

    return BlocProvider(
      create: (_) => SwipeCubit(),
      child: Scaffold(
        backgroundColor: AppColor.back,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ExhibitGuidArrow(),
            const SizedBox(height: 10,),
            SizedBox(
              height: heightSize,
              child: BlocBuilder<SwipeCubit, int>(
                builder: (context, currentPage) {
                  return PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      context.read<SwipeCubit>().updatePage(index);
                    },
                    itemBuilder: (context, index) {
                      final cardIndex = index % exhibitCards.length;
                      return Center(child: exhibitCards[cardIndex]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}