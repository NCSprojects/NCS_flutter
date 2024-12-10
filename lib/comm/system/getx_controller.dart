import 'package:get/get.dart';

class MultiMsgController extends GetxController {
  List multiMsgList = [];

  void set(List list) {
    multiMsgList = list;
    update();
  }

  void delete() {
    multiMsgList = [];
    update();
  }
}

class CommCodeController extends GetxController {
  List commCodeList = [];

  void set(List list) {
    commCodeList = list;
    update();
  }

  void delete() {
    commCodeList = [];
    update();
  }
}

class CentCodeController extends GetxController {
  List centCodeList = [];

  void set(List list) {
    centCodeList = list;
    update();
  }

  void delete() {
    centCodeList = [];
    update();
  }
}

class CustCodeController extends GetxController {
  List custCodeList = [];

  void set(List list) {
    custCodeList = list;
    update();
  }

  void delete() {
    custCodeList = [];
    update();
  }
}

class GrpMenuCodeController extends GetxController {
  List grpMenuCodeList = [];

  void set(List list) {
    grpMenuCodeList = list;
    update();
  }

  void delete() {
    grpMenuCodeList = [];
    update();
  }
}

class MenuCodeController extends GetxController {
  List menuCodeList = [];

  void set(List list) {
    menuCodeList = list;
    update();
  }

  void delete() {
    menuCodeList = [];
    update();
  }
}