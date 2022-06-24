import 'package:daisy_application/app/common/widget/header/header_deps.dart';
import 'package:daisy_application/app/foundation/flow_controller.dart';
import 'package:daisy_application/app/pages/landing-page/view/landing.dart';
import 'package:daisy_application/app/pages/post-new-job/view/post_new_job.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticatedFlowController extends StatefulWidget {
  const AuthenticatedFlowController({Key? key}) : super(key: key);

  @override
  State<AuthenticatedFlowController> createState() =>
      _AuthenticatedFlowStateController();
}

class _AuthenticatedFlowStateController
    extends FlowControllerState<AuthenticatedFlowController>
    implements
        HeaderAuthenticationListener<AuthenticatedFlowController>,
        HeaderNavigationListener<AuthenticatedFlowController> {
  @override
  AppPage createInitialPage() => AppPage(_PAGE_LANDING, const LandingPage());

  static const String _PAGE_LANDING = 'landing';

  @override
  void onBtnFindDesignerClicked() {
    // TODO: implement onBtnFindDesignerClicked
  }

  @override
  void onBtnFindJobCliked() {}

  @override
  void onBtnJobPostClicked() {
    pushSimple(() => PostNewJob(), "POST_NEW_JOB");
  }

  @override
  void onBtnSigninClicked() {
    // TODO: implement onBtnSigninClicked
  }

  @override
  void onBtnSignoutClicked() {
    // TODO: implement onBtnSignoutClicked
  }

  @override
  void onBtnSignupClicked() {
    // TODO: implement onBtnSignupClicked
  }
}
