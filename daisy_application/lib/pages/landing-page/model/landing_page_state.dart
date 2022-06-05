import 'package:flutter/cupertino.dart';

class LandingPageState with ChangeNotifier {
  var category;
  void addSelectedCategory() {
    // update category state
    notifyListeners();
  }
}
