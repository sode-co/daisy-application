import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/pages/requests-page/view/stateless_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostedJob extends StatefulWidget {
  const PostedJob({Key? key}) : super(key: key);

  @override
  State<PostedJob> createState() => _PostedJobState();
}

class _PostedJobState extends State<PostedJob> {
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
    'Select Technology, LLC ',
    'email',
    'role',
    'setting',
    'assets/images/portfolio/avatar.png',
    'District 7, Ho Chi Minh City, Vietnam ',
    'phone',
  );
  late RequestModel request = RequestModel(
    1,
    user,
    category,
    'Mobile Application Developer (iOS or/and Android)',
    'Select Technology is an IoT Solutions Company specializing in Smart City and Home Automation. Headquartered in Dallas, Texas and Remote locations in India, HCM City, and Ha Noi Viet Nam Select Technology has been a pioneer and innovator in IoT technology specifically in Smart Manufacturing, Smart City, and Home Automation. Select Technology’s mission is to provide a state-of-the-art, reliable, and comprehensive Home Automation and Smart City solution.',
    1.0,
    '1',
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 50.0, right: 0.0, top: 30.0),
        child: Column(
          children: [
            InfoJobCard(
              request: request,
            ),
            InfoJobCard(
              request: request,
            ),
            InfoJobCard(
              request: request,
            ),
          ],
        ),
      ),
    );
  }
}
