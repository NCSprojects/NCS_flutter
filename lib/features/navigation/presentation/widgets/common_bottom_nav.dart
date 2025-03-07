import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/exhibits/presentation/pages/3F/big_history_main.dart';
import 'package:ncs/features/exhibits/presentation/pages/4F/cosmos_main.dart';
import 'package:ncs/features/exhibits/presentation/pages/5F/scope_main.dart';
import 'package:ncs/features/home/presentation/pages/home_page.dart';
import 'package:ncs/features/navigation/presentation/bloc/bottom_navigation_cubit.dart';
import 'package:ncs/features/navigation/presentation/widgets/common_app_bar.dart';

class CommonBottomNav extends StatelessWidget {
  const CommonBottomNav({super.key});

  final List<Widget> _pages = const [
    HomePage(),
    CosmosMain(),
    BigHistoryMain(),
    ScopeMain(),
  ];

  @override
  Widget build(BuildContext context) {
    final double navSize = ScreenUtil.heightPercentage(0.11);
    final double itemSize = ScreenUtil.heightPercentage(0.045);
    final double fontSize = ScreenUtil.fontSize(10);
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CommonAppBar(),
          body: IndexedStack(
            index: state,
            children: _pages,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory, // 물결 효과 제거
            highlightColor: Colors.transparent,),
            child: SafeArea(
              bottom: true,
              child: Container(
                height: navSize,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.lightGray.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  backgroundColor: AppColor.back,
                  currentIndex: state,
                  onTap: (index) {
                    context.read<BottomNavCubit>().updateIndex(index);
                  },
                  selectedItemColor: AppColor.blue,
                  unselectedItemColor: AppColor.lightGray,
                  type: BottomNavigationBarType.fixed,
                  selectedLabelStyle: TextStyle(
                    color: AppColor.blue,
                    fontFamily: "Pretendard",
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  unselectedLabelStyle: TextStyle(
                    color: AppColor.lightGray,
                    fontFamily: "Pretendard",
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  items: [
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.fromLTRB(3, 5, 3, 10),
                        child: SvgPicture.asset(
                          'assets/icons/Home_off.svg', // 선택되지 않은 아이콘
                          height: itemSize,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(3, 5, 3, 10),
                        child: SvgPicture.asset(
                          'assets/icons/Home_on.svg', // 선택된 아이콘
                          height: itemSize,
                        ),
                      ),
                      label: "홈",
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.fromLTRB(3, 5, 3, 5),
                        child: SvgPicture.asset(
                          'assets/icons/BigHistory_off.svg',
                          height: itemSize,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(3, 5, 3, 5),
                        child: SvgPicture.asset(
                          'assets/icons/BigHistory_on.svg',
                          height: itemSize,
                        ),
                      ),
                      label: "3층 빅 히스토리",
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.fromLTRB(3, 5, 3, 5),
                        child: SvgPicture.asset(
                          'assets/icons/Cosmos_off.svg',
                          height: itemSize,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(3, 5, 3, 5),
                        child: SvgPicture.asset(
                          'assets/icons/Cosmos_on.svg',
                          height: itemSize,
                        ),
                      ),
                      label: "4층 코스모스",
                    ),
                    BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.fromLTRB(3, 5, 3, 5),
                        child: SvgPicture.asset(
                          'assets/icons/Scope_off.svg',
                          height: itemSize,
                        ),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(3, 5, 3, 5),
                        child: SvgPicture.asset(
                          'assets/icons/Scope_on.svg',
                          height: itemSize,
                        ),
                      ),
                      label: "5층 천체관측",
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}