// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';

import 'package:daisy_application/core_services/models/workspace/workspace_model.dart';
import 'package:daisy_application/schema/file_transfer.pb.dart';
import 'package:daisy_application/schema/models.pbgrpc.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

@JsonSerializable()
class ResourceModel extends JsonSerializable with HiveObjectMixin {
  int? id;
  DateTime? createdAt;
  String? fileType;
  String? fileName;
  WorkspaceModel? workspace;
  String? workStatus;
  @JsonKey(ignore: true)
  Uint8List? binary;

  ResourceModel(
      {this.id,
      this.createdAt,
      this.fileType,
      this.fileName,
      this.workspace,
      this.workStatus,
      this.binary});

  ResourceModel.fromProto(Resource proto) {
    id = proto.id;
    createdAt = DateTime.fromMillisecondsSinceEpoch(proto.createdAt.toInt());
    fileType = proto.file.mimeType;
    fileName = proto.file.fileName;
    workStatus = proto.workStatus;
    workspace = WorkspaceModel.fromProto(proto.workspace);
  }

  factory ResourceModel.fromJson(Map<String, dynamic> json) =>
      _$ResourceModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ResourceModelToJson(this);
}
