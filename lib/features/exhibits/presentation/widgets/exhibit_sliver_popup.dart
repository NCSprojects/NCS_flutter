import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/exhibits/presentation/bloc/draggable_sheet_cubit.dart';
import 'package:ncs/features/exhibits/presentation/widgets/exhibit_reservation_box.dart';

class PopupContent extends StatelessWidget {
  final List<Map<String, dynamic>> reservationData;
  final String title;
  final String date;
  final String description;
  final String mainText;
  final String subText;
  final String imagePath;

  const PopupContent({
    Key? key,
    required this.reservationData,
    required this.title,
    required this.date,
    required this.description,
    required this.mainText,
    required this.subText,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DraggableSheetCubit draggableCubit = context.read<DraggableSheetCubit>();
    final double fontSize = ScreenUtil.fontSize(18);

    return DraggableScrollableSheet(
      controller: draggableCubit.controller,
      initialChildSize: 1,
      minChildSize: 0.8,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Material(
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    NCSText(
                      text: "예약하기",
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 0,
                      runSpacing: 5,
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        reservationData.length < 4 ? reservationData.length : 4,
                            (index) => ExhibitReservationBox(
                          index: index,
                          time: reservationData[index]["time"],
                          title: reservationData[index]["title"],
                          currentSeat: reservationData[index]["currentSeat"],
                          maxSeat: reservationData[index]["maxSeat"],
                        ),
                      ),
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