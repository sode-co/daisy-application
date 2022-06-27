import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/pages/signup-page/deps/signup_page_listener.dart';
import 'package:daisy_application/app/pages/signup-page/model/sign_up_page_state.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/domain-services/authentication-service.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SignupFlowController extends AutoRouter {
  @override
  AutoRouterState createState() => _SignupFlowControllerState();
}

class _SignupFlowControllerState extends AutoRouterState
    implements SignupPageListener<AutoRouter> {
  late AuthenticationService _authService;

  @override
  void initState() {
    super.initState();
    _authService = locator.get();
  }

  @override
  void onBtnSignupClicked(UserRole selectedRole) => _signup(selectedRole);

  Future<void> _signup(UserRole selectedRole) async {
    final result = await _authService.signUp(UserRole.CUSTOMER);
    _appState.isLoggedIn = result.failureType == FAILURE_TYPE.NONE;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpPageState(),
        ),
      ],
      child: super.build(context),
    );
  }

  ApplicationState get _appState => context.read();
}
