// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModel _$RequestModelFromJson(Map<String, dynamic> json) => RequestModel(
      id: json['id'] as int? ?? 0,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
      budget: (json['budget'] as num?)?.toDouble(),
      status: json['status'] as String?,
      timeline: json['timeline'] == null
          ? null
          : DateTime.parse(json['timeline'] as String),
      customer: json['customer'] == null
          ? null
          : UserModel.fromJson(json['customer'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => RequestModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    )..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$RequestModelToJson(RequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'budget': instance.budget,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'timeline': instance.timeline?.toIso8601String(),
      'customer': instance.customer,
      'items': instance.items,
    };
