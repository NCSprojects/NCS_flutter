//flutter pub run build_runner build --delete-conflicting-outputs

import 'package:ncs/core/utils/host.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'auth_model.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: "$host/auth")
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST("/verify")
  Future<AuthWrapperResponse> verifyAuthCode(@Body() AuthRequest request);

  @POST("/reissue")
  Future<TokenReissueWrapperResponse> reissueToken(@Header("Authorization") String token);
}