part of 'auth_bloc.dart';

abstract class AuthEvent {}

class VerifyAuthCodeEvent extends AuthEvent {
  final String randomId;

  VerifyAuthCodeEvent({required this.randomId});
}

class ReissueTokenEvent extends AuthEvent {
  final String refreshToken;

  ReissueTokenEvent({required this.refreshToken});
}