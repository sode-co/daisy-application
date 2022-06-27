import 'package:daisy_application/app/pages/post-new-job/view/components.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/domain-services/authentication-service.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/pages/landing-page/model/landing_page_state.dart';
import 'package:daisy_application/app/pages/landing-page/view/mobile.dart';
import 'package:daisy_application/app/pages/landing-page/view/web.dart';
import 'package:daisy_application/app/listeners/WidgetListener.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  static const RouteName = '';
  static final routeHandler =
      Handler(handlerFunc: (context, parameters) => const LandingPage());

  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState(locator.get());
}

class _LandingPageState extends State<LandingPage> with WidgetListener {
  late LandingPageState _landingPageState;
  final AuthenticationService _authenticationService;

  _LandingPageState(this._authenticationService);

  @override
  initState() {
    _landingPageState = LandingPageState();
    super.initState();
  }

  @override
  Future<void> onBtnSigninClicked() async {
    final result = await _authenticationService.signIn();
    ApplicationState state = context.read();

    state.isLoggedIn = result.failureType == FAILURE_TYPE.NONE;
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
        Provider<WidgetListener>(create: (_) => this),
      ],
      child: Scaffold(
        appBar: const Header(),
        body: Responsive.isDesktop(context)
            ? const SingleChildScrollView(child: BodyLandingPageWeb())
            : const SingleChildScrollView(child: BodyLandingPageMobile()),
        floatingActionButton: Responsive.isDesktop(context)
            ? null
            : const CreateNewJobMobileBtn(),
        bottomNavigationBar:
            !Responsive.isDesktop(context) ? const BottomNavBar() : null,
      ),
    );
  }
}
