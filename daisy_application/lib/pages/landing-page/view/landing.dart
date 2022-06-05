import 'package:daisy_application/pages/common/bottomnavbar.dart';
import 'package:daisy_application/pages/common/header.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/landing-page/controller/landing_page_controller.dart';
import 'package:daisy_application/pages/landing-page/listener/landing_page_listener.dart';
import 'package:daisy_application/pages/landing-page/model/landing_page_state.dart';
import 'package:daisy_application/pages/landing-page/view/mobile.dart';
import 'package:daisy_application/pages/landing-page/view/web.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late LandingPageState _landingPageState;
  late LandingPageListener _landingPageListener;
  @override
  initState() {
    _landingPageState = LandingPageState();
    _landingPageListener = LandingPageController(_landingPageState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return _landingPageState;
          },
        ),
        Provider(create: (_) => _landingPageListener),
      ],
      child: Scaffold(
        appBar: const Header(),
        body: Responsive.isDesktop(context)
            ? const SingleChildScrollView(child: BodyLandingPageWeb())
            : const SingleChildScrollView(child: BodyLandingPageMobile()),
        bottomNavigationBar:
            !Responsive.isDesktop(context) ? const BottomNavBar() : null,
      ),
    );
  }
}
