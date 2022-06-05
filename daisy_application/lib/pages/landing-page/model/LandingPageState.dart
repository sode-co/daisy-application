import 'package:flutter/cupertino.dart';

class LandingPageState with ChangeNotifier {
  var category;
  void submitTextfieldForSelectingCategories() {
    notifyListeners();
  }
}
