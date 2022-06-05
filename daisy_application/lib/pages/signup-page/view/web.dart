import 'package:daisy_application/pages/landing-page/view/common.dart';
import 'package:daisy_application/pages/signup-page/view/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BodySignUpWeb extends StatefulWidget {
  const BodySignUpWeb({Key? key}) : super(key: key);

  @override
  State<BodySignUpWeb> createState() => _BodySignUpWebState();
}

class _BodySignUpWebState extends State<BodySignUpWeb> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SignUpImageDecoration(),
              SignUpSelectBox(),
            ],
          ),
        ),
        Footer(),
      ],
    );
  }
}
