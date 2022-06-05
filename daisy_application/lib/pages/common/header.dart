import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/common/style.dart';
import 'package:daisy_application/pages/landing-page/view/common.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AppBar(
      title: (Responsive.isDesktop(context))
          ? Row(children: <Widget>[
              const SizedBox(width: 150),
              Image.asset('assets/images/weblogo.png', width: 100),
              TextButton(
                  child: const Text('Categories', style: Style.stringBold),
                  onPressed: () {
                    Navigator.pushNamed(context, '/categories');
                  }),
              TextButton(
                  child: const Text('How it works', style: Style.stringBold),
                  onPressed: () {}),
              TextButton(
                  child: const Text('Find a designer', style: Style.stringBold),
                  onPressed: () {}),
            ])
          : Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Image.asset('assets/images/weblogo.png', width: 100)),
      actions: <Widget>[
        if (Responsive.isDesktop(context)) const SizedBox(width: 5),
        const SizedBox(width: 1),
        const SignUpButton(),
        if (Responsive.isDesktop(context)) const SizedBox(width: 10),
        const Center(child: Text('or')),
        TextButton(
            child: const Text('Sign in', style: Style.mediumStringBold),
            onPressed: () {
              // Navigator.pushNamed(context, '/login');
            }),
        if (Responsive.isDesktop(context)) SizedBox(width: size.width * 0.1),
      ],
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
