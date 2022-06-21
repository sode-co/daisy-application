import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_children_list_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class CategoryChildrenListModel extends JsonSerializable with HiveObjectMixin {
  List<CategoryModel>? childCategories;

  CategoryChildrenListModel(
    this.childCategories,
  );

  CategoryChildrenListModel.init();

  factory CategoryChildrenListModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryChildrenListModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CategoryChildrenListModelToJson(this);
}
