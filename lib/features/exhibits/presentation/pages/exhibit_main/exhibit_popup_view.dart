import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/comm/widget/show_snack_bar.dart';
import 'package:ncs/features/exhibits/presentation/bloc/draggable_sheet_cubit.dart';
import 'package:ncs/features/exhibits/presentation/bloc/selection_cubit.dart';
import 'package:ncs/features/exhibits/presentation/widgets/exhibit_container_style.dart';
import 'package:ncs/features/exhibits/presentation/widgets/exhibit_sliver_popup.dart';
import 'package:ncs/features/navigation/presentation/widgets/backspace_app_bar.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/navigation/presentation/widgets/button_bottom_nav.dart';
import 'package:ncs/features/reservations/presentation/bloc/count_cubit.dart';

class ExhibitPopupView extends StatelessWidget {
  const ExhibitPopupView({
    Key? key,
    required this.title,
    required this.date,
    required this.description,
    required this.mainText,
    required this.subText,
    required this.imagePath,
  }) : super(key: key);

  final String title;
  final String date;
  final String description;
  final String mainText;
  final String subText;
  final String imagePath;

  // 예약 데이터 (상수로 정의)
  final List<Map<String, dynamic>> reservationData = const [
    {"time": "10", "title": "VR", "currentSeat": "3", "maxSeat": "4"},
    {"time": "11", "title": "VR", "currentSeat": "2", "maxSeat": "4"},
    {"time": "12", "title": "VR", "currentSeat": "1", "maxSeat": "4"},
    {"time": "13", "title": "VR", "currentSeat": "4", "maxSeat": "4"},
    {"time": "14", "title": "VR", "currentSeat": "3", "maxSeat": "4"},
  ];

  void handleReservation(BuildContext context, int selectedIndex) {
    if (selectedIndex < 0 || selectedIndex >= reservationData.length) {
      print("선택된 박스가 없습니다.");
      showSnackBar(context, "시간을 선택해주세요.", AppColor.blue);
    } else {
      final selectedData = reservationData[selectedIndex];
      int guardianCount = context.read<CounterCubit>().guardianCount;
      int participantCount = context.read<CounterCubit>().participantCount;

      print("선택된 예약 정보:");
      print("시간: ${selectedData["time"]}시");
      print("전시 제목: ${selectedData["title"]}");
      print("좌석: ${selectedData["currentSeat"]}/${selectedData["maxSeat"]}석");
      print("예약 인원 수: ${guardianCount + participantCount} 명");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double popupHeightSize = ScreenUtil.heightPercentage(0.6);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ExhibitSelectionCubit()),
          BlocProvider(create: (_) => DraggableSheetCubit()),
          BlocProvider(create: (_) => CounterCubit()),
        ],
        child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: AppColor.back,
              extendBody: true,
              appBar: const BackspaceAppBar(),
              bottomNavigationBar: BlocBuilder<ExhibitSelectionCubit, int>(
                builder: (context, selectedIndex) {
                  return ButtonBottomNav(
                    reservationData: reservationData,
                    buttonTitle: "예약하기",
                    onPressedCallback: () => handleReservation(context, selectedIndex),
                  );
                },
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  ExhibitContainerStyle(
                    title: title,
                    date: date,
                    description: description,
                    mainText: mainText,
                    subText: subText,
                    imagePath: imagePath,
                  ),
                  SizedBox(
                    height: popupHeightSize,
                    child: PopupContent(
                      reservationData: reservationData,
                      title: title,
                      date: date,
                      description: description,
                      mainText: mainText,
                      subText: subText,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}