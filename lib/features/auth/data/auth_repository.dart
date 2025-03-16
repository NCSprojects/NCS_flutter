import 'auth_api.dart';
import 'auth_model.dart';

class AuthRepository {
  final AuthApi authApi;

  AuthRepository({required this.authApi});

  Future<AuthData> verifyAuthCode(String randomId) async {
    final response = await authApi.verifyAuthCode(AuthRequest(randomId: randomId));
    if (response.data == null) {
      // data 필드가 없으면 오류 메시지로 예외 발생
      throw Exception(response.message.isNotEmpty ? response.message : "서버 오류 발생");
    }
    return response.data!;
  }

  Future<String> reissueAccessToken(String refreshToken) async {
    final response = await authApi.reissueToken("Bearer $refreshToken");
    if (response.data == null) {
      throw Exception(response.message.isNotEmpty ? response.message : "서버 오류 발생");
    }
    return response.data!.accessToken;
  }
}