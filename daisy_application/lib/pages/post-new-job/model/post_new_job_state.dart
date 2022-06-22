import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

class PostNewJobState with ChangeNotifier {
  CategoryModel parentCategory = CategoryModel.init()
    ..name = 'Nhận diện thương hiệu';
  int numOfChildrenReq = 0;
  List<RequestModel> childrenRequest = [];
  RequestModel parentRequest = RequestModel.init()
    ..status = ''
    ..items = null;
}
