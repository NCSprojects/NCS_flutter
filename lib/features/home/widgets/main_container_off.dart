import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncs/app/theme/custom_box_shadow.dart';
import 'package:ncs/app/theme/custom_button.dart';
import 'package:ncs/app/theme/custom_num_input.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/home/presentation/bloc/input_cubit.dart';

class MainContainerOff extends StatelessWidget {
  const MainContainerOff({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InputCubit(),
      child: BlocBuilder<InputCubit, InputState>(
        builder: (context, state) {
          final inputCubit = context.read<InputCubit>();

          return Container(
            width: ScreenUtil.widthPercentage(0.8),
            height: ScreenUtil.heightPercentage(0.35),
            decoration: NCSshadow.custom(
              color: Colors.white,
              borderRadius: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const NCSText(
                  text: '입장 번호 입력하기',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),

                const NCSText(
                  text: '관람권 결제 후 받은 번호 6자리를 입력하고 예약하세요.',
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil.heightPercentage(0.045),
                        child: CustomNumInput.numberInputField(
                          context: context,
                          controller: TextEditingController(text: state.inputText),
                          text: "안내받은 번호 6자리를 입력해주세요.",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          onChanged: inputCubit.updateInput,
                        ),
                      ),

                      // Confirm Button
                      const SizedBox(height: 10),
                      SizedBox(
                        height: ScreenUtil.heightPercentage(0.045),
                        child: CustomButton.customButton(
                          text: "확인",
                          onPressed: () => inputCubit.validateInput(context),
                          fontSize: 12,
                          borderRadius: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}