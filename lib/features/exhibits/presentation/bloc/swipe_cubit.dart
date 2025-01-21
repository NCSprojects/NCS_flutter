import 'package:flutter_bloc/flutter_bloc.dart';

class SwipeCubit extends Cubit<int> {
  SwipeCubit() : super(1000);

  void updatePage(int index) {
    emit(index);
  }
}