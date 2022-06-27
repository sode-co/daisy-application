import 'package:daisy_application/app/pages/signup-page/model/sign_up_page_state.dart';
import 'package:daisy_application/app/pages/signup-page/view/mobile.dart';
import 'package:daisy_application/app/pages/signup-page/view/web.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/domain-services/authentication-service.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/pages/landing-page/view/landing.dart';
import 'package:daisy_application/app/listeners/WidgetListener.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState(locator.get());
}

class _SignUpState extends State<SignUp> {
  late SignUpPageState _signUpPageState;
  final AuthenticationService _authService;

  _SignUpState(this._authService);

  @override
  initState() {
    _signUpPageState = SignUpPageState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: Responsive.isDesktop(context)
          ? const SingleChildScrollView(child: BodySignUpWeb())
          : const SingleChildScrollView(child: BodySignUpMobile()),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const BottomNavBar() : null,
    );
  }
}
