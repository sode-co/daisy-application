import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class IntroJobCard extends StatelessWidget {
  const IntroJobCard({Key? key, required this.img, required this.user})
      : super(key: key);
  final String img;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 300,
      child: Row(
        children: [
          Image.asset(img),
        ],
      ),
    );
  }
}
