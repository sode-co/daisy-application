// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationModel _$AuthenticationModelFromJson(Map<String, dynamic> json) =>
    AuthenticationModel(
      json['message'] as String?,
      json['accessToken'] as String?,
      json['refreshToken'] as String?,
    )
      ..accessTokenExpiredAt = json['accessTokenExpiredAt'] as int?
      ..refreshTokenExpiredAt = json['refreshTokenExpiredAt'] as int?;

Map<String, dynamic> _$AuthenticationModelToJson(
        AuthenticationModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'accessTokenExpiredAt': instance.accessTokenExpiredAt,
      'refreshTokenExpiredAt': instance.refreshTokenExpiredAt,
    };
