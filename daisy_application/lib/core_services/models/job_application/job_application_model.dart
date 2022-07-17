import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_application_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class JobApplicationModel extends JsonSerializable with HiveObjectMixin {
  int? id = 0;
  CategoryModel? category;
  String? title;
  String? description;
  double? offeredPrice;
  UserModel? freelancer;
  RequestModel? request;
  String? status;

  JobApplicationModel(
      {this.id,
      this.category,
      this.title,
      this.description,
      this.offeredPrice,
      this.freelancer,
      this.request,
      this.status});

  JobApplicationModel.init();

  factory JobApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$JobApplicationModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$JobApplicationModelToJson(this);
}
