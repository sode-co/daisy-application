import 'package:flutter/material.dart';

class LandingPageState with ChangeNotifier {
  // ignore: prefer_typing_uninitialized_variables
  var category;
  void addSelectedCategory() {
    // update category state
    notifyListeners();
  }
}
