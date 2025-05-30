import 'package:flutter/material.dart';
import 'package:ncs/app/theme/custom_button.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';

class ButtonBottomNav extends StatelessWidget {
  final List<Map<String, dynamic>> reservationData;
  final String buttonTitle;
  final VoidCallback onPressedCallback;

  const ButtonBottomNav({
    Key? key,
    required this.reservationData,
    required this.buttonTitle,
    required this.onPressedCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double navSize = ScreenUtil.heightPercentage(0.11);

    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        height: navSize,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(-4, -4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80, 25, 80, 25),
          child: SizedBox(
            child: CustomButton.customButton(
              text: buttonTitle,
              onPressed: onPressedCallback,
              fontSize: 18,
              borderRadius: 5,
            ),
          ),
        ),
      ),
    );
  }
}
