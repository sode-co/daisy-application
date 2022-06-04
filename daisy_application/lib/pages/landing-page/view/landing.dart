import 'package:daisy_application/pages/common/header.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/landing-page/view/mobile.dart';
import 'package:daisy_application/pages/landing-page/view/web.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context) ? const Header() : null,
      body: Responsive.isDesktop(context)
          ? const SingleChildScrollView(child: BodyLandingPageWeb())
          : const SingleChildScrollView(child: BodyLandingPageMobile()),
    );
  }
}
