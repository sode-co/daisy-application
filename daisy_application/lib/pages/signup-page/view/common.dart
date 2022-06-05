import 'package:daisy_application/pages/common/colors.dart';
import 'package:daisy_application/pages/common/responsive.dart';
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

enum UserRole { customer, designer }

class SignUpSelectBox extends StatefulWidget {
  const SignUpSelectBox({Key? key}) : super(key: key);

  @override
  State<SignUpSelectBox> createState() => _SignUpSelectBoxState();
}

class _SignUpSelectBoxState extends State<SignUpSelectBox> {
  UserRole? _role = UserRole.customer;
  var btnColor = const Color.fromARGB(255, 255, 255, 255);
  var textColor = const Color(MyColors.blue_gradient_01);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('SignUp', style: Style.h2blueStringBold),
        Line(
            width: 40,
            height: 5,
            color: const Color(MyColors.blue_gradient_01)),
        const SizedBox(height: 20),
        SizedBox(
          width: 300,
          height: 30,
          child: ListTile(
            title: const Text('I need something designed',
                style: Style.blueStringBold),
            leading: Radio<UserRole>(
              value: UserRole.customer,
              activeColor: const Color(MyColors.blue_gradient_01),
              groupValue: _role,
              onChanged: (UserRole? value) {
                setState(() {
                  _role = value;
                });
              },
            ),
          ),
        ),
        SizedBox(
          width: 300,
          height: 30,
          child: ListTile(
            title: const Text('I\'m a designer', style: Style.blueStringBold),
            leading: Radio<UserRole>(
              value: UserRole.designer,
              activeColor: const Color(MyColors.blue_gradient_01),
              groupValue: _role,
              onChanged: (UserRole? value) {
                setState(() {
                  _role = value;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 40),
        InkWell(
          onHover: (hovering) {
            hovering
                ? setState(() {
                    btnColor = const Color(MyColors.blue_gradient_01);
                    textColor = Colors.white;
                  })
                : setState(() {
                    btnColor = Colors.white;
                    textColor = const Color(MyColors.blue_gradient_01);
                  });
          },
          onTap: () {},
          child: Ink(
            decoration: BoxDecoration(
              color: btnColor,
              border: Border.all(
                color: const Color(MyColors.blue_gradient_01),
                width: Responsive.isDesktop(context) ? 0.5 : 1.0,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset('assets/images/google.png', width: 16),
                  const SizedBox(width: 5),
                  Text(
                    'SignUp with FPT email',
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
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
