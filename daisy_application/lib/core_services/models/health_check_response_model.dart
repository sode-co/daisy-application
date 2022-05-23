import 'package:json_annotation/json_annotation.dart';

part 'health_check_response_model.g.dart';

@JsonSerializable()
class HealthCheckResponseModel extends JsonSerializable {
  String? message;

  HealthCheckResponseModel(this.message);

  factory HealthCheckResponseModel.fromJson(Map<String, dynamic> json) =>
      _$HealthCheckResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$HealthCheckResponseModelToJson(this);
}
