import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/schema/models.pb.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class RequestModel extends JsonSerializable with HiveObjectMixin {
  int? id;
  UserModel? user;
  CategoryModel? category;
  String? title;
  String? description;
  double? budget;
  String? status;
  DateTime? timeLine;
  DateTime? createdAt;

  RequestModel(
    this.id,
    this.user,
    this.category,
    this.title,
    this.description,
    this.budget,
    this.status,
  );

  RequestModel.fromProto(Request proto) {
    id = proto.id;
    user = UserModel.fromProto(proto.customer);
    category = CategoryModel(
        proto.category.id, null, proto.category.name, proto.category.type);
    title = proto.title;
    budget = proto.budget;
    status = proto.status;
    timeLine = DateTime.fromMillisecondsSinceEpoch(proto.timeline.toInt());
    createdAt = DateTime.fromMillisecondsSinceEpoch(proto.createdAt.toInt());
  }

  RequestModel.init();

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RequestModelToJson(this);
}
