import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/domain-services/authentication-service.dart';
import 'package:daisy_application/pages/common/bottomnavbar.dart';
import 'package:daisy_application/pages/common/header.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/discovery-designer/view/components.dart';
import 'package:daisy_application/pages/landing-page/view/landing.dart';
import 'package:daisy_application/pages/listeners/WidgetListener.dart';
import 'package:daisy_application/pages/signup-page/model/sign_up_page_state.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoverDesigner extends StatefulWidget {
  const DiscoverDesigner({Key? key}) : super(key: key);

  @override
  State<DiscoverDesigner> createState() =>
      _DiscoverDesignerState(locator.get());
}

class _DiscoverDesignerState extends State<DiscoverDesigner>
    with WidgetListener {
  late SignUpPageState _signUpPageState;
  late WidgetListener _widgetListener;
  final AuthenticationService _authService;

  _DiscoverDesignerState(this._authService);

  @override
  initState() {
    _signUpPageState = SignUpPageState();
    _widgetListener = this;
    super.initState();
  }

  @override
  Future<void> onBtnSignupClicked(UserRole role) async {
    const ns = 'signup-with-google';
    Debug.log(ns, 'signing up');
    final result = await _authService.signUp(role);

    if (result.failureType == FAILURE_TYPE.NONE) {
      ApplicationState state = context.read();
      state.isLoggedIn = true;
      LandingPage.start(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return _signUpPageState;
          },
        ),
        Provider(create: (_) => _widgetListener),
      ],
      child: Scaffold(
        appBar: const Header(),
        body: const SingleChildScrollView(
          child: DiscoverDesignerBody(),
        ),
        bottomNavigationBar:
            !Responsive.isDesktop(context) ? const BottomNavBar() : null,
      ),
    );
  }
}
