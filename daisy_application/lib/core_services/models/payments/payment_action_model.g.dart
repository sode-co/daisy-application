// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentActionModel _$PaymentActionModelFromJson(Map<String, dynamic> json) =>
    PaymentActionModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      amount: (json['amount'] as num?)?.toDouble(),
      orderId: json['orderId'] as String?,
      status: json['status'] as String?,
      data: json['data'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$PaymentActionModelToJson(PaymentActionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'amount': instance.amount,
      'orderId': instance.orderId,
      'data': instance.data,
      'status': instance.status,
      'type': instance.type,
    };
