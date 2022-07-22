// ignore_for_file: non_constant_identifier_names

import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portfolio_model.g.dart';

@JsonSerializable()
class PortfolioModel extends JsonSerializable with HiveObjectMixin {
  int? id;
  bool? isActive;
  String? biography;
  UserModel? freelancer;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  PortfolioModel({
    this.id,
    this.isActive,
    this.biography,
    this.freelancer,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });
  PortfolioModel.init();

  factory PortfolioModel.fromJson(Map<String, dynamic> json) =>
      _$PortfolioModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PortfolioModelToJson(this);
}
