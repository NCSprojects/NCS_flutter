import 'package:flutter/material.dart';
import 'package:ncs/app/theme/custom_box_shadow.dart';
import 'package:ncs/app/theme/custom_button.dart';
import 'package:ncs/app/theme/custom_num_input.dart';
import 'package:ncs/app/theme/custom_text_style.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/comm/widget/common.dart';

class MainContainerOff extends StatefulWidget {
  const MainContainerOff({super.key, required this.title});

  final String title;

  @override
  State<MainContainerOff> createState() => _MainContainerOffState();
}

class _MainContainerOffState extends State<MainContainerOff> {
  final TextEditingController numberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? errorCode;

  void validateAndSubmit() {
    const String pattern = r'^\d{6}\$';
    final RegExp regExp = RegExp(pattern); // 숫자 6자리 정규식
    final Match? match = regExp.firstMatch(numberController.text);

    if (match == null) {
      setState(() {
        showSnackBar(context, '숫자 6자리를 입력해주세요.');
        numberController.text = '';
      });
    } else {
      // 정상 확인 시 서버에 context 담아서 통신.
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    controller: numberController,
                    text: "안내받은 번호 6자리를 입력해주세요.",
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (errorCode != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    errorCode!,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ],
                const SizedBox(height: 10),
                SizedBox(
                  height: ScreenUtil.heightPercentage(0.045),
                  child: CustomButton.customButton(
                    text: "확인",
                    onPressed: validateAndSubmit,
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
  }
}
