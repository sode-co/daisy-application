// ignore_for_file: non_constant_identifier_names

import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/core_services/models/workspace/workspace_model.dart';
import 'package:daisy_application/schema/models.pb.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project_model.g.dart';

@JsonSerializable()
class ProjectModel extends JsonSerializable with HiveObjectMixin {
  int? id;
  UserModel? customer;
  UserModel? freelancer;
  CategoryModel? category;
  DateTime? resolvedAt;
  String? data;
  String? preferedLanguage;
  String? name;
  String? description;
  DateTime? timeline;
  double? budget;
  String? status;
  List<WorkspaceModel> workspaces = [];
  bool? isAllowedPublic;
  RequestModel? request;

  ProjectModel(
      {this.id,
      this.workspaces = const [],
      this.customer,
      this.freelancer,
      this.category,
      this.resolvedAt,
      this.data,
      this.preferedLanguage,
      this.name,
      this.description,
      this.timeline,
      this.budget,
      this.isAllowedPublic,
      this.request,
      this.status});

  ProjectModel.init();

  ProjectModel.fromProto(Project proto) {
    id = proto.id;
    customer = UserModel.fromProto(proto.customer);
    freelancer = UserModel.fromProto(proto.freelancer);
    category = CategoryModel.fromProto(proto.category);
    resolvedAt = DateTime.fromMillisecondsSinceEpoch(proto.resolvedAt.toInt());
    data = proto.data;
    name = proto.name;
    description = proto.description;
    timeline = DateTime.fromMillisecondsSinceEpoch(proto.timeline.toInt());
    budget = proto.budget;
    status = proto.status;
    workspaces =
        proto.workspaces.map((e) => WorkspaceModel.fromProto(e)).toList();
    request = RequestModel.fromProto(proto.request);
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}
