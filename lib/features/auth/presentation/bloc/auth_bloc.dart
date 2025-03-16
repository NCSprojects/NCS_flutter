import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncs/features/auth/data/auth_repository.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<VerifyAuthCodeEvent>(_onVerifyAuthCode);
    on<ReissueTokenEvent>(_onReissueToken);
  }

  Future<void> _onVerifyAuthCode(
      VerifyAuthCodeEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final data = await repository.verifyAuthCode(event.randomId);
      emit(AuthSuccess(accessToken: data.accessToken));
    } on DioError catch (e) {
      emit(AuthFailure(error: e.response?.data["error"] ?? "서버 오류 발생"));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> _onReissueToken(
      ReissueTokenEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final accessToken = await repository.reissueAccessToken(event.refreshToken);
      emit(AuthSuccess(accessToken: accessToken));
    } on DioError catch (e) {
      emit(AuthFailure(error: e.response?.data["error"] ?? "서버 오류 발생"));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}