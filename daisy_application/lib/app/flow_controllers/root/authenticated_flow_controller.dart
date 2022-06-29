import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/widget/header/header_deps.dart';
import 'package:daisy_application/app/router/router.gr.dart' as Routers;
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/domain-services/authentication-service.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticatedFlowController extends StatefulWidget {
  final Widget child;

  const AuthenticatedFlowController({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<AuthenticatedFlowController> createState() =>
      _AuthenticatedFlowControllerState();
}

class _AuthenticatedFlowControllerState
    extends State<AuthenticatedFlowController>
    implements
        HeaderAuthenticationListener<AuthenticatedFlowController>,
        HeaderNavigationListener<AuthenticatedFlowController> {
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
  void onBtnJobPostClicked() {
    context.router.push(const Routers.PostNewJobRoute());
  }

  @override
  void onBtnSignoutClicked() => _signOut();

  Future<void> _signOut() async {
    await _authService.signOut();
    _appState.isLoggedIn = false;
  }

  ApplicationState get _appState => context.read();

  @override
  void onBtnSigninClicked() {}

  @override
  void onBtnSignupClicked() {}

  @override
  Widget build(BuildContext context) => widget.child;

  @override
  void onBtnProfileDetailsClicked() {
    context.router.push(const Routers.UpdateProfileRoute());
  }
}
