import 'package:daisy_application/app/common/widget/header/header_deps.dart';
import 'package:daisy_application/app/foundation/flow_controller.dart';
import 'package:daisy_application/app/pages/landing-page/view/landing.dart';
import 'package:daisy_application/app/pages/post-new-job/view/post_new_job.dart';
import 'package:flutter/cupertino.dart';

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
  @override
  AppPage createInitialPage() => AppPage(_PAGE_LANDING, const LandingPage());

  static const String _PAGE_LANDING = 'landing';

  @override
  void onBtnFindDesignerClicked() {
    // TODO: implement onBtnFindDesignerClicked
  }

  @override
  void onBtnFindJobCliked() {
    // TODO: implement onBtnFindJobCliked
  }

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
