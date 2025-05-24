import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/navigation/presentation/bloc/bottom_navigation_cubit.dart';
import 'package:ncs/features/notifications/presentation/pages/alarm_main.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CommonAppBar({super.key});

  @override
  Size get preferredSize {
    final double calculatedHeight = ScreenUtil.heightPercentage(0.16);
    return Size.fromHeight(calculatedHeight);
  }

  @override
  Widget build(BuildContext context) {
    final double nowonHeight = ScreenUtil.heightPercentage(0.045);
    final double symbolHeight = ScreenUtil.heightPercentage(0.033);

    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        color: AppColor.input,
        boxShadow: [
          BoxShadow(
            color: AppColor.lightGray.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SvgPicture.asset(
              'assets/icons/symbol.svg',
            ),
          ),
          title: GestureDetector(
            onTap: () {
                context.read<BottomNavCubit>().updateIndex(0);
                Get.offNamed('/home');
            },
            child: SvgPicture.asset(
              'assets/icons/nowon.svg',
              height: nowonHeight,
            ),
          ),
          centerTitle: true, // 제목 중앙 정렬
          backgroundColor: AppColor.input,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/alarm.svg',
                  height: symbolHeight,
                ),
                onPressed: (){
                  Get.to(() => const AlarmMain());
                },
              ),
            ),
          ],
          scrolledUnderElevation:0,
          elevation: 0, // AppBar 자체의 그림자 제거
        ),
      ),
    );
  }
}