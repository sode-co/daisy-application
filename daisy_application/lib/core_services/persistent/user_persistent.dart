import 'dart:convert';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:hive/hive.dart';

class UserAdapter extends TypeAdapter<UserModel> {
  @override
  UserModel read(BinaryReader reader) {
    return UserModel.fromJson(json.decode(reader.read()));
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.write(json.encode(obj.toJson()));
  }
}

class UserPersistent {
  static const BOX_NAME = 'USER_BOX';
  Future<UserModel?> getCurrentAuth() async {
    var box = Hive.box(BOX_NAME);
    return box.containsKey(0) ? box.get(0) : null;
  }

  void remove() async {
    Hive.box(BOX_NAME).clear();
  }

  void set(UserModel user) async {
    final box = Hive.box(BOX_NAME);
    remove();
    box.add(user);
  }

  UserModel? get() {
    final box = Hive.box(BOX_NAME);
    return box.containsKey(0) ? box.get(0) : null;
  }
}
