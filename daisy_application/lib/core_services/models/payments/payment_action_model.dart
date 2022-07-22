import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_action_model.g.dart';

@JsonSerializable()
class PaymentActionModel extends JsonSerializable with HiveObjectMixin {
  int? id;
  DateTime? createdAt;
  double? amount;
  String? orderId;
  String? data;
  String? status;
  String? type;

  PaymentActionModel(
      {this.id,
      this.createdAt,
      this.amount,
      this.orderId,
      this.status,
      this.data,
      this.type});

  PaymentActionModel.empty();

  factory PaymentActionModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentActionModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$PaymentActionModelToJson(this);
}
