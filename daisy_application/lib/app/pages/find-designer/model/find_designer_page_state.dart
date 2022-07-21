import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:flutter/material.dart';

class FindDesigneScreenState extends ChangeNotifier {
  CategoryModel? _parentCategory;
  CategoryModel? _childCategory;

  set parentCategory(CategoryModel? value) {
    _parentCategory = value;
    notifyListeners();
  }

  CategoryModel? get parentCategory => _parentCategory;

  set childCategory(CategoryModel? value) {
    _childCategory = value;
    notifyListeners();
  }

  CategoryModel? get childCategory => _childCategory;
}
