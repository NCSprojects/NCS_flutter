// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRequest _$AuthRequestFromJson(Map<String, dynamic> json) => AuthRequest(
      randomId: json['randomId'] as String,
    );

Map<String, dynamic> _$AuthRequestToJson(AuthRequest instance) =>
    <String, dynamic>{
      'randomId': instance.randomId,
    };

AuthWrapperResponse _$AuthWrapperResponseFromJson(Map<String, dynamic> json) =>
    AuthWrapperResponse(
      status: json['status'] as String? ?? '',
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : AuthData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthWrapperResponseToJson(
        AuthWrapperResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

AuthData _$AuthDataFromJson(Map<String, dynamic> json) => AuthData(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

TokenReissueWrapperResponse _$TokenReissueWrapperResponseFromJson(
        Map<String, dynamic> json) =>
    TokenReissueWrapperResponse(
      status: json['status'] as String? ?? '',
      code: (json['code'] as num?)?.toInt() ?? 0,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : TokenData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenReissueWrapperResponseToJson(
        TokenReissueWrapperResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

TokenData _$TokenDataFromJson(Map<String, dynamic> json) => TokenData(
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$TokenDataToJson(TokenData instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
    };
