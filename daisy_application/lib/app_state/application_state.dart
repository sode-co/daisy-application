import 'package:daisy_application/core_services/persistent/authentication_persistent.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ApplicationState extends ChangeNotifier {
  bool _isLoggedIn = false;

  ApplicationState() {
    Future.sync(() async {
      if (!Hive.isBoxOpen(AuthenticationPersistent.BOX_NAME)) {
        await Hive.openBox(AuthenticationPersistent.BOX_NAME);
      }

      var box = Hive.box(AuthenticationPersistent.BOX_NAME);
      isLoggedIn = box.get(0) != null;
    });
  }

  get isLoggedIn => _isLoggedIn;

  set isLoggedIn(value) {
    _isLoggedIn = value;
    notifyListeners();
  }
}
