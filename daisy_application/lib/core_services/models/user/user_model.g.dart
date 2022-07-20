// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      json['id'] as int?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['displayName'] as String?,
      json['email'] as String?,
      json['role'] as String?,
      json['settings'] as String?,
      json['avatar'] as String?,
      json['address'] as String?,
      json['phone'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'displayName': instance.displayName,
      'email': instance.email,
      'role': instance.role,
      'settings': instance.settings,
      'avatar': instance.avatar,
      'address': instance.address,
      'phone': instance.phone,
      'description': instance.description,
    };
