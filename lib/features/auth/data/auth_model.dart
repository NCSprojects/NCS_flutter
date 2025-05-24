import 'package:json_annotation/json_annotation.dart';

part 'part/auth_model.g.dart';

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
class AuthData {
  @JsonKey(name: "accessToken")
  final String accessToken;
  @JsonKey(name: "refreshToken")
  final String refreshToken;
  @JsonKey(name: "guardians") //보호자
  final int guardians;
  @JsonKey(name: "visitors")
  final int visitors;

  AuthData({
    required this.accessToken,
    required this.refreshToken,
    required this.guardians,
    required this.visitors
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