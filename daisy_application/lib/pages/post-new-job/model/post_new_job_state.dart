import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

class PostNewJobState with ChangeNotifier {
  RequestModel parentRequest = RequestModel.init()
    ..status = ''
    ..timeline = DateTime.now()
    ..category = (CategoryModel.init()..name = 'Nhận diện thương hiệu')
    ..items = <RequestModel>[];
}
