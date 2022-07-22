import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'momo_model.g.dart';

@JsonSerializable()
class MomoModel extends JsonSerializable with HiveObjectMixin {
  String? paymentRedirectUrl;

  MomoModel({this.paymentRedirectUrl});

  factory MomoModel.fromJson(Map<String, dynamic> json) =>
      _$MomoModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MomoModelToJson(this);
}
