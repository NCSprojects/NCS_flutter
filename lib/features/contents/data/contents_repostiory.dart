// lib/features/contents/data/contents_repository.dart
import 'package:ncs/features/contents/data/contents_api.dart';
import 'package:ncs/features/contents/data/contents_model.dart';

class ContentsRepository {
  final ContentsApi api;

  ContentsRepository({required this.api});

  Future<Contents> fetchContentsByFloor(int floor) async {
    final contents = await api.getContentsByFloor(floor);
    return contents;
  }
}