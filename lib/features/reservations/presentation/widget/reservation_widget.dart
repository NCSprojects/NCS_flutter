import 'package:flutter/material.dart';
import 'package:ncs/comm/setting/screen_util_setting.dart';
import 'package:ncs/features/reservations/presentation/page/reservation_page.dart';


class ReservationWidget extends StatelessWidget {
  final List<Map<String, dynamic>> reservationData;

  const ReservationWidget({super.key, required this.reservationData,});


  @override
  Widget build(BuildContext context) {
    final double reservationHeight= ScreenUtil.heightPercentage(0.25);

    return DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0.8,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: reservationHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(-4, -4),
                    ),
                  ],
                ),
                child: const ReservationPage(),
              ),
            ],
          );
        }
    );
  }
}