// ignore_for_file: non_constant_identifier_names

import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
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
  bool? isAllowedPublic;
  RequestModel? request;

  ProjectModel(
      {this.id,
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

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);
}
