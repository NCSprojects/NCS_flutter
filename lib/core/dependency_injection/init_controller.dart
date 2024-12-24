import 'package:get/get.dart';
import '../../features/codes/presentaion/controllers/getx_controller.dart';

initControllers() {
  Get.lazyPut(() => MultiMsgController());
  Get.lazyPut(() => CommCodeController());
  Get.lazyPut(() => CentCodeController());
  Get.lazyPut(() => CustCodeController());
  Get.lazyPut(() => GrpMenuCodeController());
  Get.lazyPut(() => MenuCodeController());
}