// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) => RequestModel(
      json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      json['title'] as String?,
      json['description'] as String?,
      (json['budget'] as num?)?.toDouble(),
      json['status'] as String?,
      json['timeline'],
      (json['items'] as List<dynamic>?)
          ?.map((e) => RequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RequestModelToJson(RequestModel instance) =>
    <String, dynamic>{
      'category': instance.category!.toJson(),
      'title': instance.title,
      'description': instance.description,
      'budget': instance.budget,
      'status': instance.status,
      'timeline': instance.timeline,
      'items': instance.items == null
          ? null
          : instance.items!.map((item) => item.toJson()).toList(),
    };
