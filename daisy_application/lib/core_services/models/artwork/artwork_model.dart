// ignore_for_file: non_constant_identifier_names

import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/portfolio/portfolio_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artwork_model.g.dart';

@JsonSerializable()
class ArtworkModel extends JsonSerializable with HiveObjectMixin {
  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  String? description;
  String? image;
  PortfolioModel? portfolio;
  CategoryModel? category;
  String? title;
  String? data;
  String? resources;
  String? objectId;

  ArtworkModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.description,
    this.image,
    this.portfolio,
    this.category,
    this.title,
    this.data,
    this.resources,
    this.objectId,
  });
  ArtworkModel.init();

  factory ArtworkModel.fromJson(Map<String, dynamic> json) =>
      _$ArtworkModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ArtworkModelToJson(this);
}
