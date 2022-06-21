// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_parent_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryParentListModel _$CategoryParentListModelFromJson(
        Map<String, dynamic> json) =>
    CategoryParentListModel(
      (json['parentCategories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryParentListModelToJson(
        CategoryParentListModel instance) =>
    <String, dynamic>{
      'parentCategories': instance.parentCategories,
    };
