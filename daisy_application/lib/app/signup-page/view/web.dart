import 'package:daisy_application/app/pages/landing-page/view/common.dart';
import 'package:daisy_application/app/signup-page/view/common.dart';
import 'package:flutter/material.dart';

class BodySignUpWeb extends StatefulWidget {
  const BodySignUpWeb({Key? key}) : super(key: key);

  @override
  State<BodySignUpWeb> createState() => _BodySignUpWebState();
}

class _BodySignUpWebState extends State<BodySignUpWeb> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.25, vertical: size.height * 0.1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SignUpImageDecoration(),
              SizedBox(width: size.width * 0.1),
              const SignUpSelectBox(),
            ],
          ),
        ),
        const Footer(),
      ],
    );
  }
}
