part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthReissue extends AuthState {
  final String accessToken;

  AuthReissue({
    required this.accessToken,
  });
}

class AuthSuccess extends AuthState {
  final String accessToken;
  final String refreshToken;
  final int guardians;
  final int visitors;

  AuthSuccess(
      {required this.accessToken,
      required this.refreshToken,
      required this.guardians,
      required this.visitors});
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}
