// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      id: json['id'] as int?,
      customer: json['customer'] == null
          ? null
          : UserModel.fromJson(json['customer'] as Map<String, dynamic>),
      freelancer: json['freelancer'] == null
          ? null
          : UserModel.fromJson(json['freelancer'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
      data: json['data'] as String?,
      preferedLanguage: json['preferedLanguage'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      timeline: json['timeline'] == null
          ? null
          : DateTime.parse(json['timeline'] as String),
      budget: (json['budget'] as num?)?.toDouble(),
      isAllowedPublic: json['isAllowedPublic'] as bool?,
      request: json['request'] == null
          ? null
          : RequestModel.fromJson(json['request'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer': instance.customer,
      'freelancer': instance.freelancer,
      'category': instance.category,
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
      'data': instance.data,
      'preferedLanguage': instance.preferedLanguage,
      'name': instance.name,
      'description': instance.description,
      'timeline': instance.timeline?.toIso8601String(),
      'budget': instance.budget,
      'status': instance.status,
      'isAllowedPublic': instance.isAllowedPublic,
      'request': instance.request,
    };
