import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/exhibits/presentation/bloc/selection_cubit.dart';

class ExhibitReservationBox extends StatelessWidget {
  final int index;
  final String time;
  final String title;
  final String currentSeat;
  final String maxSeat;

  const ExhibitReservationBox({
    super.key,
    required this.index,
    required this.time,
    required this.title,
    required this.currentSeat,
    required this.maxSeat,
  });

  @override
  Widget build(BuildContext context) {
    final double fontSize = ScreenUtil.fontSize(12);
    final double containerHeight = ScreenUtil.heightPercentage(0.07);
    final double containerWidth = ScreenUtil.widthPercentage(0.2);

    return BlocBuilder<ExhibitSelectionCubit, int>(
      builder: (context, selectedIndex) {
        bool isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () {
            context.read<ExhibitSelectionCubit>().selectBox(index);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color: isSelected ? AppColor.skyBlue : Colors.transparent,
                width: isSelected ? 2 : 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  NCSText(
                    text: "$time시",
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    width: containerWidth,
                    height: containerHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(
                          color: AppColor.outLine,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          NCSText(
                            text: title,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w700,
                          ),
                          NCSText(
                            text: "$currentSeat/$maxSeat석",
                            fontSize: fontSize,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}