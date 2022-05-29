import 'package:daisy_application/pages/common/header.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/common/sidebar.dart';
import 'package:daisy_application/pages/landing-page/mobile.dart';
import 'package:daisy_application/pages/landing-page/web.dart';
import 'package:flutter/material.dart';
class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      drawer: !Responsive.isDesktop(context) ? const Sidebar() : null,
      body: Responsive.isDesktop(context) ? const SingleChildScrollView(child: BodyLandingPageWeb()) : SingleChildScrollView(child: BodyLandingPageMobile()),
    );
  }
}
