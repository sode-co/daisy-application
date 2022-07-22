// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';
import 'package:daisy_application/core_services/models/workspace/workspace_model.dart';
import 'package:daisy_application/schema/file_transfer.pbgrpc.dart';
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
  double? fileSize;
  WorkspaceModel? workspace;
  String? resourceKey;
  String? workStatus;
  TransferStatus? transferStatus;
  @JsonKey(ignore: true)
  Uint8List? binary;

  ResourceModel(
      {this.id,
      this.createdAt,
      this.fileType,
      this.fileName,
      this.fileSize,
      this.workspace,
      this.resourceKey,
      this.workStatus,
      this.transferStatus,
      this.binary});

  ResourceModel.fromProto(Resource proto) {
    id = proto.id;
    fileSize = proto.file.fileSize.toDouble();
    createdAt = DateTime.fromMillisecondsSinceEpoch(proto.createdAt.toInt());
    fileType = proto.file.mimeType;
    fileName = proto.file.fileName;
    workStatus = proto.workStatus;
    resourceKey = proto.resourceKey;
    workspace = WorkspaceModel.fromProto(proto.workspace);
    binary = Uint8List(0);
  }

  factory ResourceModel.fromJson(Map<String, dynamic> json) =>
      _$ResourceModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ResourceModelToJson(this);
}
