import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

class PostNewJobState with ChangeNotifier {
  RequestModel parentRequest = RequestModel.init()
    ..status = 'string'
    ..timeline = DateTime.now().add(const Duration(days: 3)).toString()
    ..category = (CategoryModel.init()
      ..name = 'Nhận diện thương hiệu'
      ..id = 1)
    ..items = <RequestModel>[];
}
