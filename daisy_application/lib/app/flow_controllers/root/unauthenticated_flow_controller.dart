import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/widget/header/header_deps.dart';
import 'package:daisy_application/app/router/router.gr.dart' as Routers;
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/domain-services/authentication-service.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnAuthenticatedFlowController extends StatefulWidget {
  final Widget child;

  const UnAuthenticatedFlowController({Key? key, required this.child})
      : super(key: key);

  @override
  State<UnAuthenticatedFlowController> createState() =>
      _UnAuthenticatedFlowControllerState();
}

class _UnAuthenticatedFlowControllerState
    extends State<UnAuthenticatedFlowController>
    implements
        HeaderAuthenticationListener<UnAuthenticatedFlowController>,
        HeaderNavigationListener<UnAuthenticatedFlowController> {
  late AuthenticationService _authService;

  @override
  void initState() {
    super.initState();
    _authService = locator.get();
  }

  @override
  void onBtnFindDesignerClicked() {}

  @override
  void onBtnFindJobCliked() {
    context.router.push(const Routers.DicoveryJobRoute());
  }

  @override
  void onBtnJobPostClicked() {}

  @override
  void onBtnSignoutClicked() => _signOut();

  Future<void> _signOut() async {
    await _authService.signOut();
  }

  Future<void> _signIn() async {
    var result = await _authService.signIn();
    _appState.isLoggedIn = result.failureType == FAILURE_TYPE.NONE;
  }

  @override
  void onBtnSigninClicked() => _signIn();

  @override
  void onBtnSignupClicked() {
    context.router.push(const Routers.SignupRoute());
  }

  ApplicationState get _appState => context.read();

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void onBtnProfileDetailsClicked() {
    context.router.push(const Routers.UpdateProfileRoute());
  }
}
