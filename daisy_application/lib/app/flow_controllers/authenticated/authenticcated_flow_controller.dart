import 'package:daisy_application/app/common/widget/header/header_deps.dart';
import 'package:daisy_application/app/flow_controllers/discovery_job/discovery_job_flow_controller.dart';
import 'package:daisy_application/app/flow_controllers/post_new_job/post_new_job_flow_controller.dart';
import 'package:daisy_application/app/foundation/flow_controller.dart';
import 'package:daisy_application/app/foundation/routes.dart';
import 'package:daisy_application/app/pages/landing-page/view/landing.dart';
import 'package:daisy_application/app/pages/post-new-job/view/post_new_job.dart';
import 'package:daisy_application/domain-services/authentication-service.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AuthenticatedFlowController extends StatefulWidget {
  const AuthenticatedFlowController({Key? key}) : super(key: key);

  @override
  State<AuthenticatedFlowController> createState() =>
      _AuthenticatedFlowStateControllerState();
}

class _AuthenticatedFlowStateControllerState
    extends FlowControllerState<AuthenticatedFlowController>
    implements
        HeaderAuthenticationListener<AuthenticatedFlowController>,
        HeaderNavigationListener<AuthenticatedFlowController> {
  late AuthenticationService _authService;

  @override
  AppPage createInitialPage() => AppPage(_PAGE_LANDING, const LandingPage());

  static const String _PAGE_LANDING = '';

  @override
  void initState() {
    super.initState();
    _authService = locator.get();
  }

  @override
  void onBtnFindDesignerClicked() {
    // TODO: implement onBtnFindDesignerClicked
  }

  @override
  void onBtnFindJobCliked() {
    pushSimple(() => const DicoveryJobFlowController(), 'discovery-job');
  }

  @override
  void onBtnJobPostClicked() {
    pushName(PostNewJobFlowController.RouteName);
  }

  @override
  void onBtnSignoutClicked() => _signOut();

  Future<void> _signOut() async {
    await _authService.signOut();
    appState.isLoggedIn = false;
  }

  @override
  void onBtnSigninClicked() {}

  @override
  void onBtnSignupClicked() {}

  @override
  FluroRouter createInitialRoute() => FluroRouter()
    ..define(PostNewJobFlowController.RouteName,
        handler: PostNewJobFlowController.routeHandler)
    ..define(LandingPage.RouteName, handler: LandingPage.routeHandler);
}
