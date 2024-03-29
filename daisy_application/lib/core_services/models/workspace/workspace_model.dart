import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/schema/models.pbgrpc.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workspace_model.g.dart';

@JsonSerializable()
class WorkspaceModel extends JsonSerializable with HiveObjectMixin {
  int? id;
  String? status;
  ProjectModel? project;
  RequestModel? request;

  WorkspaceModel({this.id, this.status, this.project, this.request});

  WorkspaceModel.empty();

  WorkspaceModel.fromProto(Workspace proto) {
    id = proto.id;
    status = proto.status;
    project = ProjectModel.fromProto(proto.project);
    request = RequestModel.fromProto(proto.request);
  }

  factory WorkspaceModel.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WorkspaceModelToJson(this);
}
