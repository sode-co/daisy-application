import 'package:daisy_application/core_services/models/payments/payment_action_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/core_services/models/workspace/workspace_model.dart';
import 'package:daisy_application/schema/models.pbgrpc.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel extends JsonSerializable with HiveObjectMixin {
  int? id;
  DateTime? createdAt;
  double? amount;
  double? totalAmount;
  int? commission;
  String? currency;
  String? orderId;
  String? data;
  String? status;
  List<PaymentActionModel> paymentActions = [];

  PaymentModel(
      {this.id,
      this.createdAt,
      this.amount,
      this.totalAmount,
      this.commission,
      this.currency,
      this.orderId,
      this.data,
      this.status,
      this.paymentActions = const []});

  PaymentModel.empty();

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}
