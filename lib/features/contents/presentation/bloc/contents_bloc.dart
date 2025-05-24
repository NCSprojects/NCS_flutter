import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncs/features/contents/data/contents_model.dart';

import '../../data/contents_repostiory.dart';

part 'contents_event.dart';
part 'contents_state.dart';

class ContentsBloc extends Bloc<ContentsEvent, ContentsState> {
  final ContentsRepository repository;

  ContentsBloc({required this.repository}) : super(ContentsInitial()) {
    on<LoadContentsByFloor>(_onLoadContentsByFloor);
  }

  Future<void> _onLoadContentsByFloor(
      LoadContentsByFloor event,
      Emitter<ContentsState> emit,
      ) async {
    emit(ContentsLoading());
    try {
      final contents = await repository.fetchContentsByFloor(event.floor);
      print('서버 응답: ${contents.toJson()}'); // 응답 확인용
      emit(ContentsLoaded(contents: contents));
    } catch (e) {
      emit(ContentsError(message: e.toString()));
    }
  }
}