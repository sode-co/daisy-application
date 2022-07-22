// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      id: json['id'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      amount: (json['amount'] as num?)?.toDouble(),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      commission: json['commission'] as int?,
      currency: json['currency'] as String?,
      orderId: json['orderId'] as String?,
      data: json['data'] as String?,
      status: json['status'] as String?,
      paymentActions: (json['paymentActions'] as List<dynamic>?)
              ?.map(
                  (e) => PaymentActionModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'amount': instance.amount,
      'totalAmount': instance.totalAmount,
      'commission': instance.commission,
      'currency': instance.currency,
      'orderId': instance.orderId,
      'data': instance.data,
      'status': instance.status,
      'paymentActions': instance.paymentActions,
    };
