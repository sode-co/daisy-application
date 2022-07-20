// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtworkModel _$ArtworkModelFromJson(Map<String, dynamic> json) => ArtworkModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      description: json['description'] as String?,
      image: json['image'] as String?,
      portfolio: json['portfolio'] == null
          ? null
          : PortfolioModel.fromJson(json['portfolio'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      title: json['title'] as String?,
      data: json['data'] as String?,
      resources: json['resources'] as String?,
      objectId: json['objectId'] as String?,
    );

Map<String, dynamic> _$ArtworkModelToJson(ArtworkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'description': instance.description,
      'image': instance.image,
      'portfolio': instance.portfolio,
      'category': instance.category,
      'title': instance.title,
      'data': instance.data,
      'resources': instance.resources,
      'objectId': instance.objectId,
    };
