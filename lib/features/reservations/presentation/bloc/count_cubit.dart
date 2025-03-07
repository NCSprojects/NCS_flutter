import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<Map<String, int>> {
  CounterCubit() : super({"guardian": 0, "participant": 0});

  void increment(String type) {
    if (state.containsKey(type)) {
      emit({...state, type: state[type]! + 1});
    }
  }

  void decrement(String type) {
    if (state.containsKey(type) && state[type]! > 0) {
      emit({...state, type: state[type]! - 1});
    }
  }

  int get guardianCount => state["guardian"] ?? 0;
  int get participantCount => state["participant"] ?? 0;
}