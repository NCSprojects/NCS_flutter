part of 'contents_bloc.dart';

abstract class ContentsState {}

class ContentsInitial extends ContentsState {}

class ContentsLoading extends ContentsState {}

class ContentsLoaded extends ContentsState {
  final Contents contents;

  ContentsLoaded({required this.contents});
}

class ContentsError extends ContentsState {
  final String message;

  ContentsError({required this.message});
}