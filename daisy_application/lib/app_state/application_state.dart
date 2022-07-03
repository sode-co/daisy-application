import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/core_services/persistent/authentication_persistent.dart';
import 'package:daisy_application/core_services/persistent/user_persistent.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ApplicationState extends ChangeNotifier {
  bool _isLoggedIn = false;
  UserModel? _currentUser;

  ApplicationState() {
    Future.sync(() async {
      if (!Hive.isBoxOpen(AuthenticationPersistent.BOX_NAME)) {
        await Hive.openBox(AuthenticationPersistent.BOX_NAME);
      }

      if (!Hive.isBoxOpen(UserPersistent.BOX_NAME)) {
        await Hive.openBox(UserPersistent.BOX_NAME);
      }

      var authBox = Hive.box(AuthenticationPersistent.BOX_NAME);
      isLoggedIn = authBox.get(0) != null;

      var userBox = Hive.box(UserPersistent.BOX_NAME);
      _currentUser = userBox.get(0);
    });
  }

  get isLoggedIn => _isLoggedIn;

  get currentUser => _currentUser;

  set isLoggedIn(value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}
