// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscussionModel _$DiscussionModelFromJson(Map<String, dynamic> json) =>
    DiscussionModel(
      id: json['id'] as int?,
      sender: json['sender'] == null
          ? null
          : UserModel.fromJson(json['sender'] as Map<String, dynamic>),
      type: json['type'] as String?,
      content: json['content'] as String?,
      workspace: json['workspace'] == null
          ? null
          : WorkspaceModel.fromJson(json['workspace'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DiscussionModelToJson(DiscussionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'type': instance.type,
      'content': instance.content,
      'workspace': instance.workspace,
    };
