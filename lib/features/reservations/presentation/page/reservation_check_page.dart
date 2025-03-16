import 'package:flutter/material.dart';
import 'package:ncs/features/navigation/presentation/widgets/title_backspace_app_bar.dart';
import 'package:ncs/features/reservations/presentation/widget/reservation_check_widget.dart';

class ReservationCheckPage extends StatelessWidget {
  const ReservationCheckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
          appBar: TitleBackspaceAppBar(
            title: "예약완료",
            nameTagStyle: false,
          ),
          body:ReservationCheckWidget()
    );
  }
}
