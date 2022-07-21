import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';

class FindDesigneScreenState extends ChangeNotifier {
  CategoryModel? _parentCategory;
  CategoryModel? _childCategory;
  List<UserModel>? _designers;

  set parentCategory(CategoryModel? value) {
    _parentCategory = value;
    notifyListeners();
  }

  set designers(List<UserModel>? value) {
    _designers = value;
    notifyListeners();
  }

  List<UserModel>? get designers => _designers;
  CategoryModel? get parentCategory => _parentCategory;

  set childCategory(CategoryModel? value) {
    _childCategory = value;
    notifyListeners();
  }

  CategoryModel? get childCategory => _childCategory;
}
