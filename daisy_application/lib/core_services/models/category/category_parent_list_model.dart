import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_parent_list_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class CategoryParentListModel extends JsonSerializable with HiveObjectMixin {
  List? parentCategories;

  CategoryParentListModel(
    this.parentCategories,
  );

  CategoryParentListModel.init();

  factory CategoryParentListModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryParentListModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CategoryParentListModelToJson(this);
}
