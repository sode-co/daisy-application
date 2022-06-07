import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/authentication/authentication_model.dart';

class AuthenticationAdapter extends TypeAdapter<AuthenticationModel> {
  @override
  AuthenticationModel read(BinaryReader reader) {
    return AuthenticationModel.fromJson(json.decode(reader.read()));
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, AuthenticationModel obj) {
    writer.write(json.encode(obj.toJson()));
  }
}

class AuthenticationPersistent {
  static const BOX_NAME = 'AUTHENTICATION_BOX';
  Future<AuthenticationModel?> getCurrentAuth() async {
    var box = Hive.box(BOX_NAME);
    return box.containsKey(0) ? box.get(0) : null;
  }

  Future<void> removeAuth() async {
    Hive.box(BOX_NAME).clear();
  }

  Future<void> setAuth(AuthenticationModel auth) async {
    final box = Hive.box(BOX_NAME);
    AuthenticationModel currentAuth =
        box.get(0, defaultValue: AuthenticationModel(null, null, null));

    if (currentAuth.accessToken != auth.accessToken) {
      currentAuth.accessToken = auth.accessToken;
      currentAuth.accessTokenExpiredAt = DateTime.now()
          .add(const Duration(minutes: 14))
          .millisecondsSinceEpoch;
    }

    if (currentAuth.refreshToken != auth.refreshToken) {
      currentAuth.refreshToken = auth.refreshToken;
      currentAuth.refreshTokenExpiredAt =
          DateTime.now().add(const Duration(days: 100)).millisecondsSinceEpoch;
    }

    currentAuth.save();
  }
}
