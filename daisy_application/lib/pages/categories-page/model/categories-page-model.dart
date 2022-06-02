import 'package:flutter/material.dart';

class CategoriesPageModel with ChangeNotifier {
  List<String> labelSelectedCategories = [];

  void removeIfExisted(list, item) {
    if (list.contains(item)) {
      list.removeAt(list.indexOf(item));
    }
  }

  void updateSelectedCategoriesList(isSelected, label, parentLabelName) {
    if (!isSelected) {
      labelSelectedCategories.add(label);

      // if it is parent label, we will deselect all children label names
      if (label == parentLabelName) {
        if (parentLabelName == 'Logo & Identity') {
          for (var item in LogoIdentityCategories.children) {
            removeIfExisted(labelSelectedCategories, item);
          }
        }
      }
      // if it is child label, we will deselect its parent label
      else {
        removeIfExisted(labelSelectedCategories, parentLabelName);
      }
    } else {
      var index = labelSelectedCategories.indexOf(label);
      labelSelectedCategories.removeAt(index);
    }
    print(labelSelectedCategories);
    notifyListeners();
  }
}

class LogoIdentityCategories {
  static var parent = 'Logo & Identity';
  static List<String> children = [
    'Logo design',
    'Brand identity pack',
    'Social media pack',
    'Hosted website',
    'Business card',
    'Brand guide',
    'Business card',
    'Stationery',
    'Product packaging'
  ];
}
