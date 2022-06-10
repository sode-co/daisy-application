import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class UserModel extends JsonSerializable with HiveObjectMixin {
  int? id;
  String? firstName;
  String? lastName;
  String? displayName;
  String? email;
  String? role;
  String? settings;
  String? avatar;
  String? address;
  String? phone;

  UserModel(
      this.id,
      this.firstName,
      this.lastName,
      this.displayName,
      this.email,
      this.role,
      this.settings,
      this.avatar,
      this.address,
      this.phone);

  UserModel.init();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
