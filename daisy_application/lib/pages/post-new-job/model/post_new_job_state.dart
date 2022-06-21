import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

class PostNewJobState with ChangeNotifier {
  late List<RequestModel> requests;
  late List<CategoryModel> parentCategories;
  CategoryModel parentCategory = CategoryModel.init()
    ..name = 'Nhận diện thương hiệu';
  RequestModel requestTest = RequestModel.init();
}
