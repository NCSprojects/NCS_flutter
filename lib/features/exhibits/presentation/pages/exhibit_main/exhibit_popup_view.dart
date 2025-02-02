import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncs/app/theme/app_color.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/exhibits/presentation/bloc/draggable_sheet_cubit.dart';
import 'package:ncs/features/exhibits/presentation/widgets/exhibit_container_style.dart';
import 'package:ncs/features/exhibits/presentation/widgets/exhibit_sliver_popup.dart';
import 'package:ncs/features/navigation/presentation/widgets/backspace_app_bar.dart';
import 'package:ncs/features/navigation/presentation/widgets/button_bottom_nav.dart';

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

  @override
  Widget build(BuildContext context) {
    final double popupHeightSize = ScreenUtil.heightPercentage(0.5);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: const ButtonBottomNav(),
        appBar: const BackspaceAppBar(),
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.back,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
              child: BlocProvider(
                create: (_) => DraggableSheetCubit(),
                child: PopupContent(
                  title: title,
                  date: date,
                  description: description,
                  mainText: mainText,
                  subText: subText,
                  imagePath: imagePath,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
