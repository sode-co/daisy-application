import 'package:daisy_application/pages/common/colors.dart';
import 'package:daisy_application/pages/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpImageDecoration extends StatelessWidget {
  const SignUpImageDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300, child: Image.asset('assets/images/signup_decoration.jpg'));
  }
}

class SignUpSelectBox extends StatelessWidget {
  const SignUpSelectBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('SignUp', style: Style.h2blueStringBold),
        Line(width: 40, height: 5, color: Color(MyColors.blue_gradient_01)),
      ],
    );
  }
}

class Line extends StatelessWidget {
  Line({Key? key, this.width, this.height, this.color}) : super(key: key);
  final width;
  final height;
  final color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: color,
            width: 1,
          ),
        ),
      ),
    );
  }
}
