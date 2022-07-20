// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PortfolioModel _$PortfolioModelFromJson(Map<String, dynamic> json) =>
    PortfolioModel(
      id: json['id'] as int?,
      isActive: json['isActive'] as bool?,
      biography: json['biography'] as String?,
      freelancer: json['freelancer'] == null
          ? null
          : UserModel.fromJson(json['freelancer'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$PortfolioModelToJson(PortfolioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isActive': instance.isActive,
      'biography': instance.biography,
      'freelancer': instance.freelancer,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
