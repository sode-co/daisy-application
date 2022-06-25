import 'package:daisy_application/app/common/widget/header/header_deps.dart';
import 'package:daisy_application/app/foundation/flow_controller.dart';
import 'package:daisy_application/app/pages/landing-page/view/landing.dart';
import 'package:daisy_application/app/pages/post-new-job/view/post_new_job.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/domain-services/authentication-service.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UnAuthenticatedFlowController extends StatefulWidget {
  const UnAuthenticatedFlowController({Key? key}) : super(key: key);

  @override
  State<UnAuthenticatedFlowController> createState() =>
      _UnAuthenticatedFlowStateController();
}

class _UnAuthenticatedFlowStateController
    extends FlowControllerState<UnAuthenticatedFlowController>
    implements
        HeaderNavigationListener<UnAuthenticatedFlowController>,
        HeaderAuthenticationListener<UnAuthenticatedFlowController> {
  late AuthenticationService _authService;

  @override
  AppPage createInitialPage() => AppPage('', const LandingPage());

  static const String _PAGE_LANDING = 'landing';

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
    // TODO: implement onBtnFindJobCliked
  }

  @override
  void onBtnJobPostClicked() {}

  @override
  void onBtnSigninClicked() => _signin();

  void _signin() async {
    final result = await _authService.signIn();
    ApplicationState appState = context.read();
    appState.isLoggedIn = result.failureType == FAILURE_TYPE.NONE;
  }

  @override
  void onBtnSignoutClicked() {}

  @override
  void onBtnSignupClicked() {
    // TODO: implement onBtnSignupClicked
  }

  @override
  FluroRouter createInitialRoute() => FluroRouter()
    ..define('/',
        handler: Handler(handlerFunc: (ctx, p) => const LandingPage()));
}
