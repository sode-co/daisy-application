import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/schema/models.pb.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class RequestModel extends JsonSerializable with HiveObjectMixin {
  int? id = 0;
  CategoryModel? category;
  String? title;
  String? description;
  double? budget;
  String? status;
  DateTime? createdAt;
  DateTime? timeline;
  UserModel? customer;
  List<RequestModel> items = [];

  RequestModel({
    this.id = 0,
    this.category,
    this.title,
    this.description,
    this.budget,
    this.status,
    this.timeline,
    this.customer,
    this.items = const [],
  });

  RequestModel.fromProto(Request proto) {
    id = proto.id;
    category = CategoryModel(
        proto.category.id, null, proto.category.name, proto.category.type);
    title = proto.title;
    budget = proto.budget;
    status = proto.status;
    customer = UserModel.fromProto(proto.customer);
    timeline = DateTime.fromMillisecondsSinceEpoch(proto.timeline.toInt());
    createdAt = DateTime.fromMillisecondsSinceEpoch(proto.createdAt.toInt());
  }

  RequestModel.init();

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RequestModelToJson(this);

  @override
  int get hashCode => id ?? createdAt?.millisecondsSinceEpoch ?? 0;
}
