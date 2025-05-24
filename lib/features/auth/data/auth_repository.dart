import 'auth_api.dart';
import 'auth_model.dart';

class AuthRepository {
  final AuthApi authApi;

  AuthRepository({required this.authApi});

  Future<AuthData> verifyAuthCode(String randomId) async {
    return await authApi.verifyAuthCode(
      AuthRequest(randomId: randomId),
    );
  }

  Future<String> reissueAccessToken(String refreshToken) async {
    final wrapper =
    await authApi.reissueToken("Bearer $refreshToken");

    if (wrapper.data == null) {
      final msg = wrapper.message.isNotEmpty
          ? wrapper.message
          : "서버 오류 발생";
      throw Exception(msg);
    }

    return wrapper.data!.accessToken;
  }
}