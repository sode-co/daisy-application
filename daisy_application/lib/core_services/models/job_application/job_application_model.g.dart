// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobApplicationModel _$JobApplicationModelFromJson(Map<String, dynamic> json) =>
    JobApplicationModel(
      id: json['id'] as int?,
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
      offeredPrice: (json['offeredPrice'] as num?)?.toDouble(),
      freelancer: json['freelancer'] == null
          ? null
          : UserModel.fromJson(json['freelancer'] as Map<String, dynamic>),
      request: json['request'] == null
          ? null
          : RequestModel.fromJson(json['request'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$JobApplicationModelToJson(
        JobApplicationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'offeredPrice': instance.offeredPrice,
      'freelancer': instance.freelancer,
      'request': instance.request,
    };
