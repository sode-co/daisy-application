// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) => RequestModel(
      json['id'] as int?,
      json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      json['title'] as String?,
      json['description'] as String?,
      (json['budget'] as num?)?.toDouble(),
      json['status'] as String?,
      json['timeline'] == null
          ? null
          : DateTime.parse(json['timeline'] as String),
      (json['items'] as List<dynamic>?)
          ?.map((e) => RequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestModelToJson(RequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'budget': instance.budget,
      'status': instance.status,
      'timeline': instance.timeline?.toIso8601String(),
      'items': instance.items,
    };
