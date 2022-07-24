// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResourceModel _$ResourceModelFromJson(Map<String, dynamic> json) =>
    ResourceModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      fileType: json['fileType'] as String?,
      fileName: json['fileName'] as String?,
      fileSize: (json['fileSize'] as num?)?.toDouble(),
      workspace: json['workspace'] == null
          ? null
          : WorkspaceModel.fromJson(json['workspace'] as Map<String, dynamic>),
      resourceKey: json['resourceKey'] as String?,
      workStatus: json['workStatus'] as String?,
    );

Map<String, dynamic> _$ResourceModelToJson(ResourceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'fileType': instance.fileType,
      'fileName': instance.fileName,
      'fileSize': instance.fileSize,
      'workspace': instance.workspace,
      'resourceKey': instance.resourceKey,
      'workStatus': instance.workStatus,
    };
