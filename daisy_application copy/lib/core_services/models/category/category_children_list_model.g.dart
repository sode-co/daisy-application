// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_children_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryChildrenListModel _$CategoryChildrenListModelFromJson(
        Map<String, dynamic> json) =>
    CategoryChildrenListModel(
      (json['childCategories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryChildrenListModelToJson(
        CategoryChildrenListModel instance) =>
    <String, dynamic>{
      'childCategories': instance.childCategories,
    };
