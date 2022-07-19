import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/flow_controllers/discovery_job/discovery_job_flow_controller.dart';
import 'package:daisy_application/app/flow_controllers/navigation/header_navigation_flow_controller.dart';
import 'package:daisy_application/app/flow_controllers/post_new_job/post_new_job_flow_controller.dart';
import 'package:daisy_application/app/flow_controllers/root/root.dart';
import 'package:daisy_application/app/flow_controllers/signup/signup_flow_controller.dart';
import 'package:daisy_application/app/pages/discovery-job/view/discovery_job_page.dart';
import 'package:daisy_application/app/pages/landing-page/view/landing.dart';
import 'package:daisy_application/app/pages/post-new-job/view/post_new_job.dart';
import 'package:daisy_application/app/pages/signup-page/view/signup.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'FlowController,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: RootFlowController,
      children: [
        AutoRoute(
          path: 'home',
          page: EmptyRouterPage,
          initial: true,
          name: 'HomeRoute',
          children: [
            AutoRoute(path: '', page: LandingPage, initial: true),
          ],
        ),
        AutoRoute(
            path: 'post-job',
            name: 'PostNewJobRoute',
            page: PostNewJobFlowController,
            children: [
              AutoRoute(path: '', page: PostNewJob, initial: true),
            ]),
        AutoRoute(
            path: 'discovery',
            page: DicoveryJobFlowController,
            children: [
              AutoRoute(path: '', page: DiscoverJobPage, initial: true)
            ]),
        AutoRoute(
          path: 'signup',
          page: SignupFlowController,
          children: [AutoRoute(path: '', page: SignUp, initial: true)],
        )
      ],
    ),
  ],
)
class $AppRouter {}