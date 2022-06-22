import 'package:daisy_application/schema/models.pb.dart';
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

  UserModel.fromProto(User proto) {
    id = proto.id;
    firstName = proto.firstName;
    lastName = proto.lastName;
    displayName = proto.displayName;
    email = proto.email;
    role = proto.role;
    phone = proto.phone;
    avatar = proto.avatar;
    address = proto.address;
  }
}
