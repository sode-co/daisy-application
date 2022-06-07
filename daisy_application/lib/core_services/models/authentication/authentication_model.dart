import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authentication_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class AuthenticationModel extends JsonSerializable with HiveObjectMixin {
  String? message;
  String? accessToken;
  String? refreshToken;
  int? accessTokenExpiredAt;
  int? refreshTokenExpiredAt;

  AuthenticationModel.init();

  AuthenticationModel(this.message, this.accessToken, this.refreshToken);

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AuthenticationModelToJson(this);

  bool isAccessTokenExpired() =>
      accessTokenExpiredAt != null &&
      DateTime.now().millisecondsSinceEpoch >= accessTokenExpiredAt!;

  bool isRefreshTokenExpired() =>
      refreshTokenExpiredAt != null &&
      DateTime.now().millisecondsSinceEpoch >= refreshTokenExpiredAt!;
}
