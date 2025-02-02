import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncs/features/exhibits/presentation/widgets/exhibit_container_style.dart';
import 'package:ncs/features/exhibits/presentation/pages/exhibit_main/exhibit_popup_view.dart';

class ExhibitContainerButton extends StatelessWidget {
  const ExhibitContainerButton({
    super.key,
    required this.title,
    required this.date,
    required this.description,
    required this.mainText,
    required this.subText,
    required this.imagePath,
  });

  final String title;
  final String date;
  final String description;
  final String mainText;
  final String subText;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ExhibitPopupView(
          title: title,
          date: date,
          description: description,
          mainText: mainText,
          subText: subText,
          imagePath: imagePath,
        ));
      },
      child: ExhibitContainerStyle(
        title: title,
        date: date,
        description: description,
        mainText: mainText,
        subText: subText,
        imagePath: imagePath,
      ),
    );
  }
}