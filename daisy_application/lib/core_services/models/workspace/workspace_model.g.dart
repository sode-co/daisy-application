// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkspaceModel _$WorkspaceModelFromJson(Map<String, dynamic> json) =>
    WorkspaceModel(
      id: json['id'] as int?,
      status: json['status'] as String?,
      project: json['project'] == null
          ? null
          : ProjectModel.fromJson(json['project'] as Map<String, dynamic>),
      request: json['request'] == null
          ? null
          : RequestModel.fromJson(json['request'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WorkspaceModelToJson(WorkspaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'project': instance.project,
      'request': instance.request,
    };
