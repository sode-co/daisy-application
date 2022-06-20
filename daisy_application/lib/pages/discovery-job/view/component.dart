import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/pages/discovery-job/view/stateless_component.dart';
import 'package:flutter/material.dart';

class JobInfoColumn extends StatefulWidget {
  const JobInfoColumn({Key? key}) : super(key: key);

  @override
  State<JobInfoColumn> createState() => _JobInfoColumnState();
}

class _JobInfoColumnState extends State<JobInfoColumn> {
  CategoryModel category = CategoryModel(
    1,
    'category description',
    'Logo',
    'type',
  );
  UserModel user = UserModel(
    1,
    'firstname',
    'lastname',
    'displayname',
    'email',
    'role',
    'setting',
    'avatar',
    'address',
    'phone',
  );
  late RequestModel request = RequestModel(
    1,
    user,
    category,
    '1',
    '1',
    1.0,
    '1',
  );
  @override
  Widget build(BuildContext context) {
    return IntroJobCard(
      img: 'assets/images/portfolio/avatar.png',
      request: request,
    );
  }
}
