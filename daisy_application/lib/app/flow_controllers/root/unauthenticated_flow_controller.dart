import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';
import 'package:daisy_application/app/common/widget/header/header_deps.dart';
import 'package:daisy_application/app/dialogs/alert_dialog.dart';
import 'package:daisy_application/app/router/router.gr.dart' as Routers;
import 'package:daisy_application/app/router/router.gr.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/persistent/user_persistent.dart';
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
  late UserPersistent _userPersistent;

  @override
  void initState() {
    super.initState();
    _authService = locator.get();
    _userPersistent = locator.get();
  }

  @override
  void onBtnWorkspaceAndFindDesignerClicked() {}

  @override
  void onBtnFindJobCliked() {
    context.router.push(Routers.DicoveryJobRoute(request: null));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Debug.log('unauthenticated-flow', 'didChangeDependencies');
  }

  @override
  void onBtnJobPostClicked() {
    context.show(DialogAlert.error(
      context,
      title: 'Lỗi',
      message:
          'Việc đăng tin tuyển dụng yêu cầu xãc minh danh tính, xin vui lòng đăng nhập.',
      affirmativeText: 'Login now',
      negativeText: 'Not now',
      onAffirmativeClicked: _onLoginDialogAffirmativeClicked,
      onNegativeClicked: _onLoginDialogNegativeClicked,
    ));
  }

  void _onLoginDialogAffirmativeClicked() async {
    Navigator.of(context, rootNavigator: true).pop();
    await _signIn();
    context.pushRoute(PostNewJobRoute());
  }

  void _onLoginDialogNegativeClicked() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  void onBtnSignoutClicked() => _signOut();

  Future<void> _signOut() async {
    await _authService.signOut();
  }

  Future<void> _signIn() async {
    var result = await _authService.signIn();
    _appState.isLoggedIn = result.failureType == FAILURE_TYPE.NONE;
    _appState.currentUser = _userPersistent.get();
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

  @override
  void onBtnFindDesignerCliked() {
    context.router.push(const Routers.FindDesignerRoute());
  }
}
