part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String accessToken;

  AuthSuccess({required this.accessToken});
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}