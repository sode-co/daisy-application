import 'package:daisy_application/schema/models.pb.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends JsonSerializable with HiveObjectMixin {
  int? id;
  String? description;
  String? name;
  String? type;

  CategoryModel(
    this.id,
    this.description,
    this.name,
    this.type,
  );

  CategoryModel.init();

  CategoryModel.fromProto(Category proto) {
    id = proto.id;
    name = proto.name;
    type = proto.type;
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
