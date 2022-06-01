import 'package:flutter/material.dart';

class CategoriesPageModel with ChangeNotifier {
  List<String> selectedCategoriesList = [];

  void updateSelectedCategoriesList(isSelected, category) {
    if (!isSelected) {
      selectedCategoriesList.add(category);
    } else {
      var index = selectedCategoriesList.indexOf(category);
      selectedCategoriesList.removeAt(index);
    }
    print(selectedCategoriesList);
    notifyListeners();
  }
}
