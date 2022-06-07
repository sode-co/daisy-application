import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/core_services/persistent/authentication_persistent.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/common/style.dart';
import 'package:daisy_application/pages/landing-page/view/common.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ApplicationState appState = context.watch();
    final isLoggedIn = appState.isLoggedIn;
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
        if (!isLoggedIn) ...[
          const SignUpButton(),
          if (Responsive.isDesktop(context)) const SizedBox(width: 10),
          const Center(child: Text('or')),
          TextButton(
              child: const Text('Sign in', style: Style.mediumStringBold),
              onPressed: () {}),
        ],
        if (isLoggedIn)
          TextButton(
              child: const Text('Sign out', style: Style.mediumStringBold),
              onPressed: () async {
                appState.isLoggedIn = false;
                await Hive.box(AuthenticationPersistent.BOX_NAME).clear();
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
