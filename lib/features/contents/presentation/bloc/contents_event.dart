part of 'contents_bloc.dart';

abstract class ContentsEvent {}

class LoadContentsByFloor extends ContentsEvent {
  final int floor;

  LoadContentsByFloor({required this.floor});
}