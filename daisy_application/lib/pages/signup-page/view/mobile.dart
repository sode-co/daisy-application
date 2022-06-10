import 'package:flutter/material.dart';

import 'common.dart';

class BodySignUpMobile extends StatefulWidget {
  const BodySignUpMobile({Key? key}) : super(key: key);

  @override
  State<BodySignUpMobile> createState() => _BodySignUpMobileState();
}

class _BodySignUpMobileState extends State<BodySignUpMobile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.1, vertical: size.height * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SignUpImageDecoration(),
          SizedBox(height: size.width * 0.1),
          const SignUpSelectBox(),
        ],
      ),
    );
  }
}
