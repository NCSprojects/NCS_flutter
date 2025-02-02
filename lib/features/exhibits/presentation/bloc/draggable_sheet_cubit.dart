import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

/// DraggableScrollableSheet의 현재 크기(비율)를 관리하고, 임계값 이하일 때 Get.back()을 호출하는 Cubit입니다.
class DraggableSheetCubit extends Cubit<double> {
  /// 내부에서 사용할 DraggableScrollableController를 생성합니다.
  final DraggableScrollableController controller = DraggableScrollableController();

  /// dismiss 임계값 (예: 0.85 이하이면 뒤로가기)
  final double dismissThreshold = 0.85;
  bool _isDismissed = false;

  DraggableSheetCubit() : super(0.7) {
    controller.addListener(() {
      final double newSize = controller.size;
      emit(newSize);
      if (newSize < dismissThreshold && !_isDismissed) {
        _isDismissed = true;
        Get.back();
      }
    });
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}