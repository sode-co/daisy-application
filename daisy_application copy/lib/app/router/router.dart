import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/flow_controllers/discovery_job/discovery_job_flow_controller.dart';
import 'package:daisy_application/app/flow_controllers/find_designer/find_designer_flow_controller.dart';
import 'package:daisy_application/app/flow_controllers/portfolio/portfolio_flow_controller.dart';
import 'package:daisy_application/app/flow_controllers/post_new_job/post_new_job_flow_controller.dart';
import 'package:daisy_application/app/flow_controllers/project_details/project_details_controller.dart';
import 'package:daisy_application/app/flow_controllers/root/root.dart';
import 'package:daisy_application/app/flow_controllers/signup/signup_flow_controller.dart';
import 'package:daisy_application/app/flow_controllers/update_profile/update_profile_controller.dart';
import 'package:daisy_application/app/flow_controllers/workspace/workspace_flow_controller.dart';
import 'package:daisy_application/app/pages/discovery-job/view/discovery_job_page.dart';
import 'package:daisy_application/app/pages/find-designer/view/find_designer.dart';
import 'package:daisy_application/app/pages/job-details/view/job_details.dart';
import 'package:daisy_application/app/pages/landing-page/view/landing.dart';
import 'package:daisy_application/app/pages/portfolio/view/portfolio.dart';
import 'package:daisy_application/app/pages/post-new-job/view/post_new_job.dart';
import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:daisy_application/app/pages/signup-page/view/signup.dart';
import 'package:daisy_application/app/pages/update-profile/view/update_profile.dart';
import 'package:daisy_application/app/pages/work_space/view/work_space_screen.dart';

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
            path: 'profile-details',
            name: 'UpdateProfileRoute',
            page: UpdateProfileFlowController,
            children: [
              AutoRoute(
                  path: '',
                  name: '_UpdateProfileRoute',
                  page: UpdateProfile,
                  initial: true),
            ]),
        AutoRoute(path: 'workspace', page: WorkSpaceFlowController, children: [
          AutoRoute(
              path: '',
              name: '_WorkSpaceRoute',
              page: WorkspaceScreen,
              initial: true),
        ]),
        AutoRoute(
            path: 'project/:projectId',
            name: 'ProjectDetailsRoute',
            page: ProjectDetailsFlowController,
            children: [
              AutoRoute(
                  path: '',
                  name: '_ProjectDetailsRoute',
                  page: ProjectDetailsPage,
                  initial: true),
            ]),
        AutoRoute(
            path: 'discovery',
            page: DicoveryJobFlowController,
            children: [
              AutoRoute(path: '', page: DiscoverJobPage, initial: true),
            ]),
        AutoRoute(
            path: 'discovery-mobile',
            name: 'DiscoveryMobileRoute',
            page: DicoveryJobFlowController,
            children: [
              AutoRoute(path: '', page: JobDetailsScreen, initial: true),
            ]),
        AutoRoute(
          path: 'signup',
          page: SignupFlowController,
          children: [AutoRoute(path: '', page: SignUp, initial: true)],
        ),
        AutoRoute(
            path: 'portfolio',
            name: 'PortfolioRoute',
            page: PortfolioFlowController,
            children: [
              AutoRoute(
                  path: '',
                  name: '_PortfolioRoute',
                  page: PortfolioPage,
                  initial: true),
            ]),
        AutoRoute(
            path: 'find-designer',
            name: 'FindDesignerRoute',
            page: FindDesignerFlowController,
            children: [
              AutoRoute(
                  path: '',
                  name: '_FindDesignerRoute',
                  page: FindDesignerPage,
                  initial: true),
            ]),
      ],
    ),
  ],
)
class $AppRouter {}
