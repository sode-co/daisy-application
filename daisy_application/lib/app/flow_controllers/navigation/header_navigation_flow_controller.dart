import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/widget/header/header_deps.dart';
import 'package:daisy_application/app/pages/post-new-job/deps/post_new_job_deps.dart';
import 'package:daisy_application/app/router/router.gr.dart' as Routers;
import 'package:daisy_application/domain-services/authentication-service.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';

import '../../../common/debugging/logger.dart';

class HeaderNavigationFlowController extends AutoRouter
    with PreferredSizeWidget {
  const HeaderNavigationFlowController({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  AutoRouterState createState() => _HeaderNavigationFlowControllerState();
}

class _HeaderNavigationFlowControllerState extends AutoRouterState
    implements
        HeaderAuthenticationListener<AutoRouter>,
        HeaderNavigationListener<AutoRouter>,
        PostNewJobListener<AutoRouter> {
  late AuthenticationService _authService;

  @override
  void initState() {
    super.initState();
    _authService = locator.get();
  }

  @override
  void onBtnWorkspaceAndFindDesignerClicked() {
    context.router.push(const Routers.WorkSpaceRoute());
  }

  @override
  void onBtnFindDesignerCliked() {
    context.router.push(const Routers.FindDesignerRoute());
  }

  @override
  void onBtnFindJobCliked() {}

  @override
  void onBtnJobPostClicked() {
    Debug.log('post new job');
    context.router.push(const Routers.PostNewJobRoute());
  }

  @override
  void onBtnSignoutClicked() => _signOut();

  Future<void> _signOut() async {
    await _authService.signOut();
  }

  @override
  void onBtnSigninClicked() {}

  @override
  void onBtnSignupClicked() {}

  @override
  void onBtnProfileDetailsClicked() {
    context.router.push(const Routers.UpdateProfileRoute());
  }
}
