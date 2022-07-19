// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i19;

import '../../core_services/models/portfolio/portfolio_model.dart' as _i21;
import '../../core_services/models/request/request_model.dart' as _i20;
import '../flow_controllers/discovery_job/discovery_job_flow_controller.dart'
    as _i7;
import '../flow_controllers/portfolio/portfolio_flow_controller.dart' as _i9;
import '../flow_controllers/post_new_job/post_new_job_flow_controller.dart'
    as _i3;
import '../flow_controllers/project_details/project_details_controller.dart'
    as _i6;
import '../flow_controllers/root/root.dart' as _i1;
import '../flow_controllers/signup/signup_flow_controller.dart' as _i8;
import '../flow_controllers/update_profile/update_profile_controller.dart'
    as _i4;
import '../flow_controllers/workspace/workspace_flow_controller.dart' as _i5;
import '../pages/discovery-job/view/discovery_job_page.dart' as _i15;
import '../pages/job-details/view/job_details.dart' as _i16;
import '../pages/landing-page/view/landing.dart' as _i10;
import '../pages/portfolio/view/portfolio.dart' as _i18;
import '../pages/post-new-job/view/post_new_job.dart' as _i11;
import '../pages/project-details/view/project_details.dart' as _i14;
import '../pages/signup-page/view/signup.dart' as _i17;
import '../pages/update-profile/view/update_profile.dart' as _i12;
import '../pages/work_space/view/work_space_screen.dart' as _i13;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    RootRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RootFlowController());
    },
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    PostNewJobRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PostNewJobFlowController());
    },
    UpdateProfileRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.UpdateProfileFlowController());
    },
    WorkSpaceRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.WorkSpaceFlowController());
    },
    ProjectDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProjectDetailsRouteArgs>(
          orElse: () => ProjectDetailsRouteArgs(
              projectId: pathParams.getString('projectId')));
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i6.ProjectDetailsFlowController(args.projectId, key: args.key));
    },
    DicoveryJobRoute.name: (routeData) {
      final args = routeData.argsAs<DicoveryJobRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.DicoveryJobFlowController(args.request, key: args.key));
    },
    DiscoveryMobileRoute.name: (routeData) {
      final args = routeData.argsAs<DiscoveryMobileRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.DicoveryJobFlowController(args.request, key: args.key));
    },
    SignupRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.SignupFlowController());
    },
    PortfolioRoute.name: (routeData) {
      final args = routeData.argsAs<PortfolioRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.PortfolioFlowController(args.portfolio, key: args.key));
    },
    LandingPage.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.LandingPage());
    },
    PostNewJob.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.PostNewJob());
    },
    _UpdateProfileRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.UpdateProfile());
    },
    _WorkSpaceRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.WorkspaceScreen());
    },
    _ProjectDetailsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ProjectDetailsPage());
    },
    DiscoverJobPage.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.DiscoverJobPage());
    },
    JobDetailsScreen.name: (routeData) {
      final args = routeData.argsAs<JobDetailsScreenArgs>(
          orElse: () => const JobDetailsScreenArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i16.JobDetailsScreen(key: args.key, request: args.request));
    },
    SignUp.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.SignUp());
    },
    _PortfolioRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.PortfolioPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(RootRoute.name, path: '/', children: [
          _i2.RouteConfig('#redirect',
              path: '',
              parent: RootRoute.name,
              redirectTo: 'home',
              fullMatch: true),
          _i2.RouteConfig(HomeRoute.name,
              path: 'home',
              parent: RootRoute.name,
              children: [
                _i2.RouteConfig(LandingPage.name,
                    path: '', parent: HomeRoute.name)
              ]),
          _i2.RouteConfig(PostNewJobRoute.name,
              path: 'post-job',
              parent: RootRoute.name,
              children: [
                _i2.RouteConfig(PostNewJob.name,
                    path: '', parent: PostNewJobRoute.name)
              ]),
          _i2.RouteConfig(UpdateProfileRoute.name,
              path: 'profile-details',
              parent: RootRoute.name,
              children: [
                _i2.RouteConfig(_UpdateProfileRoute.name,
                    path: '', parent: UpdateProfileRoute.name)
              ]),
          _i2.RouteConfig(WorkSpaceRoute.name,
              path: 'workspace',
              parent: RootRoute.name,
              children: [
                _i2.RouteConfig(_WorkSpaceRoute.name,
                    path: '', parent: WorkSpaceRoute.name)
              ]),
          _i2.RouteConfig(ProjectDetailsRoute.name,
              path: 'project/:projectId',
              parent: RootRoute.name,
              children: [
                _i2.RouteConfig(_ProjectDetailsRoute.name,
                    path: '', parent: ProjectDetailsRoute.name)
              ]),
          _i2.RouteConfig(DicoveryJobRoute.name,
              path: 'discovery',
              parent: RootRoute.name,
              children: [
                _i2.RouteConfig(DiscoverJobPage.name,
                    path: '', parent: DicoveryJobRoute.name)
              ]),
          _i2.RouteConfig(DiscoveryMobileRoute.name,
              path: 'discovery-mobile',
              parent: RootRoute.name,
              children: [
                _i2.RouteConfig(JobDetailsScreen.name,
                    path: '', parent: DiscoveryMobileRoute.name)
              ]),
          _i2.RouteConfig(SignupRoute.name,
              path: 'signup',
              parent: RootRoute.name,
              children: [
                _i2.RouteConfig(SignUp.name, path: '', parent: SignupRoute.name)
              ]),
          _i2.RouteConfig(PortfolioRoute.name,
              path: 'portfolio',
              parent: RootRoute.name,
              children: [
                _i2.RouteConfig(_PortfolioRoute.name,
                    path: '', parent: PortfolioRoute.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.RootFlowController]
class RootRoute extends _i2.PageRouteInfo<void> {
  const RootRoute({List<_i2.PageRouteInfo>? children})
      : super(RootRoute.name, path: '/', initialChildren: children);

  static const String name = 'RootRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
      : super(HomeRoute.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.PostNewJobFlowController]
class PostNewJobRoute extends _i2.PageRouteInfo<void> {
  const PostNewJobRoute({List<_i2.PageRouteInfo>? children})
      : super(PostNewJobRoute.name,
            path: 'post-job', initialChildren: children);

  static const String name = 'PostNewJobRoute';
}

/// generated route for
/// [_i4.UpdateProfileFlowController]
class UpdateProfileRoute extends _i2.PageRouteInfo<void> {
  const UpdateProfileRoute({List<_i2.PageRouteInfo>? children})
      : super(UpdateProfileRoute.name,
            path: 'profile-details', initialChildren: children);

  static const String name = 'UpdateProfileRoute';
}

/// generated route for
/// [_i5.WorkSpaceFlowController]
class WorkSpaceRoute extends _i2.PageRouteInfo<void> {
  const WorkSpaceRoute({List<_i2.PageRouteInfo>? children})
      : super(WorkSpaceRoute.name,
            path: 'workspace', initialChildren: children);

  static const String name = 'WorkSpaceRoute';
}

/// generated route for
/// [_i6.ProjectDetailsFlowController]
class ProjectDetailsRoute extends _i2.PageRouteInfo<ProjectDetailsRouteArgs> {
  ProjectDetailsRoute(
      {required String projectId,
      _i19.Key? key,
      List<_i2.PageRouteInfo>? children})
      : super(ProjectDetailsRoute.name,
            path: 'project/:projectId',
            args: ProjectDetailsRouteArgs(projectId: projectId, key: key),
            rawPathParams: {'projectId': projectId},
            initialChildren: children);

  static const String name = 'ProjectDetailsRoute';
}

class ProjectDetailsRouteArgs {
  const ProjectDetailsRouteArgs({required this.projectId, this.key});

  final String projectId;

  final _i19.Key? key;

  @override
  String toString() {
    return 'ProjectDetailsRouteArgs{projectId: $projectId, key: $key}';
  }
}

/// generated route for
/// [_i7.DicoveryJobFlowController]
class DicoveryJobRoute extends _i2.PageRouteInfo<DicoveryJobRouteArgs> {
  DicoveryJobRoute(
      {required _i20.RequestModel? request,
      _i19.Key? key,
      List<_i2.PageRouteInfo>? children})
      : super(DicoveryJobRoute.name,
            path: 'discovery',
            args: DicoveryJobRouteArgs(request: request, key: key),
            initialChildren: children);

  static const String name = 'DicoveryJobRoute';
}

class DicoveryJobRouteArgs {
  const DicoveryJobRouteArgs({required this.request, this.key});

  final _i20.RequestModel? request;

  final _i19.Key? key;

  @override
  String toString() {
    return 'DicoveryJobRouteArgs{request: $request, key: $key}';
  }
}

/// generated route for
/// [_i7.DicoveryJobFlowController]
class DiscoveryMobileRoute extends _i2.PageRouteInfo<DiscoveryMobileRouteArgs> {
  DiscoveryMobileRoute(
      {required _i20.RequestModel? request,
      _i19.Key? key,
      List<_i2.PageRouteInfo>? children})
      : super(DiscoveryMobileRoute.name,
            path: 'discovery-mobile',
            args: DiscoveryMobileRouteArgs(request: request, key: key),
            initialChildren: children);

  static const String name = 'DiscoveryMobileRoute';
}

class DiscoveryMobileRouteArgs {
  const DiscoveryMobileRouteArgs({required this.request, this.key});

  final _i20.RequestModel? request;

  final _i19.Key? key;

  @override
  String toString() {
    return 'DiscoveryMobileRouteArgs{request: $request, key: $key}';
  }
}

/// generated route for
/// [_i8.SignupFlowController]
class SignupRoute extends _i2.PageRouteInfo<void> {
  const SignupRoute({List<_i2.PageRouteInfo>? children})
      : super(SignupRoute.name, path: 'signup', initialChildren: children);

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i9.PortfolioFlowController]
class PortfolioRoute extends _i2.PageRouteInfo<PortfolioRouteArgs> {
  PortfolioRoute(
      {required _i21.PortfolioModel? portfolio,
      _i19.Key? key,
      List<_i2.PageRouteInfo>? children})
      : super(PortfolioRoute.name,
            path: 'portfolio',
            args: PortfolioRouteArgs(portfolio: portfolio, key: key),
            initialChildren: children);

  static const String name = 'PortfolioRoute';
}

class PortfolioRouteArgs {
  const PortfolioRouteArgs({required this.portfolio, this.key});

  final _i21.PortfolioModel? portfolio;

  final _i19.Key? key;

  @override
  String toString() {
    return 'PortfolioRouteArgs{portfolio: $portfolio, key: $key}';
  }
}

/// generated route for
/// [_i10.LandingPage]
class LandingPage extends _i2.PageRouteInfo<void> {
  const LandingPage() : super(LandingPage.name, path: '');

  static const String name = 'LandingPage';
}

/// generated route for
/// [_i11.PostNewJob]
class PostNewJob extends _i2.PageRouteInfo<void> {
  const PostNewJob() : super(PostNewJob.name, path: '');

  static const String name = 'PostNewJob';
}

/// generated route for
/// [_i12.UpdateProfile]
class _UpdateProfileRoute extends _i2.PageRouteInfo<void> {
  const _UpdateProfileRoute() : super(_UpdateProfileRoute.name, path: '');

  static const String name = '_UpdateProfileRoute';
}

/// generated route for
/// [_i13.WorkspaceScreen]
class _WorkSpaceRoute extends _i2.PageRouteInfo<void> {
  const _WorkSpaceRoute() : super(_WorkSpaceRoute.name, path: '');

  static const String name = '_WorkSpaceRoute';
}

/// generated route for
/// [_i14.ProjectDetailsPage]
class _ProjectDetailsRoute extends _i2.PageRouteInfo<void> {
  const _ProjectDetailsRoute() : super(_ProjectDetailsRoute.name, path: '');

  static const String name = '_ProjectDetailsRoute';
}

/// generated route for
/// [_i15.DiscoverJobPage]
class DiscoverJobPage extends _i2.PageRouteInfo<void> {
  const DiscoverJobPage() : super(DiscoverJobPage.name, path: '');

  static const String name = 'DiscoverJobPage';
}

/// generated route for
/// [_i16.JobDetailsScreen]
class JobDetailsScreen extends _i2.PageRouteInfo<JobDetailsScreenArgs> {
  JobDetailsScreen({_i19.Key? key, _i20.RequestModel? request})
      : super(JobDetailsScreen.name,
            path: '', args: JobDetailsScreenArgs(key: key, request: request));

  static const String name = 'JobDetailsScreen';
}

class JobDetailsScreenArgs {
  const JobDetailsScreenArgs({this.key, this.request});

  final _i19.Key? key;

  final _i20.RequestModel? request;

  @override
  String toString() {
    return 'JobDetailsScreenArgs{key: $key, request: $request}';
  }
}

/// generated route for
/// [_i17.SignUp]
class SignUp extends _i2.PageRouteInfo<void> {
  const SignUp() : super(SignUp.name, path: '');

  static const String name = 'SignUp';
}

/// generated route for
/// [_i18.PortfolioPage]
class _PortfolioRoute extends _i2.PageRouteInfo<void> {
  const _PortfolioRoute() : super(_PortfolioRoute.name, path: '');

  static const String name = '_PortfolioRoute';
}
