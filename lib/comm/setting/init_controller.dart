import 'package:get/get.dart';
import '../system/getx_controller.dart';

initControllers() {
  Get.lazyPut(() => MultiMsgController());
  Get.lazyPut(() => CommCodeController());
  Get.lazyPut(() => CentCodeController());
  Get.lazyPut(() => CustCodeController());
  Get.lazyPut(() => GrpMenuCodeController());
  Get.lazyPut(() => MenuCodeController());
}