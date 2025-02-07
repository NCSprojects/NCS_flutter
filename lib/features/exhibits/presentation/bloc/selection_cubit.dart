import 'package:flutter_bloc/flutter_bloc.dart';

class ExhibitSelectionCubit extends Cubit<int> {
  ExhibitSelectionCubit() : super(-1);

  void selectBox(int index) => emit(index);
}