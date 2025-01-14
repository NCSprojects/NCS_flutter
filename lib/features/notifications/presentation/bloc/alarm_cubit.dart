import 'package:flutter_bloc/flutter_bloc.dart';

// 상태
class AlarmState {
  final List<Map<String, String>> alarms; // 알람 리스트
  final Map<int, bool> dismissedStates; // 알람별 스와이프 상태

  AlarmState({
    required this.alarms,
    required this.dismissedStates,
  });

  // 업데이트
  AlarmState copyWith({
    List<Map<String, String>>? alarms,
    Map<int, bool>? dismissedStates,
  }) {
    return AlarmState(
      alarms: alarms ?? this.alarms,
      dismissedStates: dismissedStates ?? this.dismissedStates,
    );
  }
}

// AlarmCubit
class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit()
      : super(AlarmState(
    alarms: [
      {
        "title": "입장 5분전 알람",
        "description":
        "예약하신 천체투영실 14:00 코코몽 우주대모험이 시작 될 예정입니다.",
        "imagePath": "assets/images/sun.png",
      },
      {
        "title": "입장 10분전 알람",
        "description": "예약하신 천체투영실 14:30 화성 탐험이 시작됩니다.",
        "imagePath": "assets/images/sun.png",
      },
    ],
    dismissedStates: {},
  ));

  // 삭제 기능
  void deleteAlarm(int index) {
    final updatedAlarms = List<Map<String, String>>.from(state.alarms);
    updatedAlarms.removeAt(index);
    final updatedDismissedStates = Map<int, bool>.from(state.dismissedStates)
      ..remove(index);

    emit(state.copyWith(
      alarms: updatedAlarms,
      dismissedStates: updatedDismissedStates,
    ));
  }

  // 스와이프 기능
  void setDismissed(int index, bool isDismissed) {
    final updatedDismissedStates = Map<int, bool>.from(state.dismissedStates)
      ..[index] = isDismissed;

    emit(state.copyWith(
      dismissedStates: updatedDismissedStates,
    ));
  }
}