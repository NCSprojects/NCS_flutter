import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthRequest {
  @JsonKey(name: "randomId")
  final String randomId;

  AuthRequest({required this.randomId});

  factory AuthRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AuthRequestToJson(this);
}

@JsonSerializable()
class AuthWrapperResponse {
  @JsonKey(defaultValue: "")
  final String status;
  @JsonKey(defaultValue: 0)
  final int code;
  @JsonKey(defaultValue: "")
  final String message;
  // 오류 응답 시 data 필드가 없을 수 있으므로 nullable 처리
  final AuthData? data;

  AuthWrapperResponse({
    required this.status,
    required this.code,
    required this.message,
    this.data,
  });

  factory AuthWrapperResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthWrapperResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthWrapperResponseToJson(this);
}

@JsonSerializable()
class AuthData {
  @JsonKey(name: "accessToken")
  final String accessToken;
  @JsonKey(name: "refreshToken")
  final String refreshToken;

  AuthData({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);
  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}

@JsonSerializable()
class TokenReissueWrapperResponse {
  @JsonKey(defaultValue: "")
  final String status;
  @JsonKey(defaultValue: 0)
  final int code;
  @JsonKey(defaultValue: "")
  final String message;
  // 오류 응답 시 data가 없을 수 있으므로 nullable 처리
  final TokenData? data;

  TokenReissueWrapperResponse({
    required this.status,
    required this.code,
    required this.message,
    this.data,
  });

  factory TokenReissueWrapperResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenReissueWrapperResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TokenReissueWrapperResponseToJson(this);
}

@JsonSerializable()
class TokenData {
  @JsonKey(name: "accessToken")
  final String accessToken;

  TokenData({
    required this.accessToken,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) =>
      _$TokenDataFromJson(json);
  Map<String, dynamic> toJson() => _$TokenDataToJson(this);
}