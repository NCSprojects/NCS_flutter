import 'package:get/get.dart';
import 'package:ncs/features/navigation/presentation/widgets/common_bottom_nav.dart';
import 'package:ncs/features/notifications/presentation/pages/alarm_main.dart';
import 'package:ncs/features/reservations/presentation/page/reservation_check_page.dart';

class NavigatorNamed {
  static List<GetPage> getPages = [
    GetPage(name: '/home', page: () => const CommonBottomNav()),
    GetPage(name: '/alarm', page: () => const AlarmMain()),
    GetPage(name: '/check/success', page:  () => const ReservationCheckPage())
  ];
}