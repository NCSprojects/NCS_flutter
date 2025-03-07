import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/reservations/presentation/bloc/count_cubit.dart';

class CounterWidget extends StatelessWidget {
  final String type; // 'guardian' 또는 'participant'

  const CounterWidget({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerHeight = ScreenUtil.heightPercentage(0.04);
    final double containerWidth = ScreenUtil.widthPercentage(0.3);
    final double fontSize = ScreenUtil.fontSize(18);

    return BlocBuilder<CounterCubit, Map<String, int>>(
      builder: (context, state) {
        int count = state[type] ?? 0; // 현재 값 가져오기

        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.skyBlue, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => context.read<CounterCubit>().decrement(type),
                  child: Container(
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(right: BorderSide(color: AppColor.skyBlue, width: 2)),
                    ),
                    child: NCSText(text: "-", fontSize: fontSize, fontWeight: FontWeight.w900),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: NCSText(text: "$count", fontSize: fontSize, fontWeight: FontWeight.normal),
                ),
                GestureDetector(
                  onTap: () => context.read<CounterCubit>().increment(type),
                  child: Container(
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      border: Border(left: BorderSide(color: AppColor.skyBlue, width: 2)),
                    ),
                    child: NCSText(text: "+", fontSize: fontSize, fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}