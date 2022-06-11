import 'package:flutter/material.dart';

class UserManagementState with ChangeNotifier {
  // ignore: prefer_typing_uninitialized_variables
  var pageCount = 1;

  void nextPage() {
    pageCount++;
    notifyListeners();
  }

  void previousPage() {
    pageCount--;
    notifyListeners();
  }
}
