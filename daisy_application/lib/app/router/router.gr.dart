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
import 'package:flutter/material.dart' as _i17;

import '../flow_controllers/discovery_job/discovery_job_flow_controller.dart'
    as _i7;
import '../flow_controllers/post_new_job/post_new_job_flow_controller.dart'
    as _i3;
import '../flow_controllers/project_details/project_details_controller.dart'
    as _i6;
import '../flow_controllers/root/root.dart' as _i1;
import '../flow_controllers/signup/signup_flow_controller.dart' as _i8;
import '../flow_controllers/update_profile/update_profile_controller.dart'
    as _i4;
import '../flow_controllers/workspace/workspace_flow_controller.dart' as _i5;
import '../pages/discovery-job/view/discovery_job_page.dart' as _i14;
import '../pages/job-details/view/job_details.dart' as _i16;
import '../pages/landing-page/view/landing.dart' as _i9;
import '../pages/post-new-job/view/post_new_job.dart' as _i10;
import '../pages/project-details/view/project_details.dart' as _i13;
import '../pages/signup-page/view/signup.dart' as _i15;
import '../pages/update-profile/view/update_profile.dart' as _i11;
import '../pages/work_space/view/work_space_screen.dart' as _i12;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
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
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i6.ProjectDetailsFlowController());
    },
    DicoveryJobRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.DicoveryJobFlowController());
    },
    SignupRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.SignupFlowController());
    },
    JobDetailsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.DicoveryJobFlowController());
    },
    LandingPage.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.LandingPage());
    },
    PostNewJob.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.PostNewJob());
    },
    _UpdateProfileRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.UpdateProfile());
    },
    _WorkSpaceRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.WorkspaceScreen());
    },
    _ProjectDetailsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ProjectDetailsPage());
    },
    DiscoverJobPage.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.DiscoverJobPage());
    },
    SignUp.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.SignUp());
    },
    _JobDetailsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.JobDetailsScreen());
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
              path: 'project-details',
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
          _i2.RouteConfig(SignupRoute.name,
              path: 'signup',
              parent: RootRoute.name,
              children: [
                _i2.RouteConfig(SignUp.name, path: '', parent: SignupRoute.name)
              ]),
          _i2.RouteConfig(JobDetailsRoute.name,
              path: 'job-details',
              parent: RootRoute.name,
              children: [
                _i2.RouteConfig(_JobDetailsRoute.name,
                    path: '', parent: JobDetailsRoute.name)
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
class ProjectDetailsRoute extends _i2.PageRouteInfo<void> {
  const ProjectDetailsRoute({List<_i2.PageRouteInfo>? children})
      : super(ProjectDetailsRoute.name,
            path: 'project-details', initialChildren: children);

  static const String name = 'ProjectDetailsRoute';
}

/// generated route for
/// [_i7.DicoveryJobFlowController]
class DicoveryJobRoute extends _i2.PageRouteInfo<void> {
  const DicoveryJobRoute({List<_i2.PageRouteInfo>? children})
      : super(DicoveryJobRoute.name,
            path: 'discovery', initialChildren: children);

  static const String name = 'DicoveryJobRoute';
}

/// generated route for
/// [_i8.SignupFlowController]
class SignupRoute extends _i2.PageRouteInfo<void> {
  const SignupRoute({List<_i2.PageRouteInfo>? children})
      : super(SignupRoute.name, path: 'signup', initialChildren: children);

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i7.DicoveryJobFlowController]
class JobDetailsRoute extends _i2.PageRouteInfo<void> {
  const JobDetailsRoute({List<_i2.PageRouteInfo>? children})
      : super(JobDetailsRoute.name,
            path: 'job-details', initialChildren: children);

  static const String name = 'JobDetailsRoute';
}

/// generated route for
/// [_i9.LandingPage]
class LandingPage extends _i2.PageRouteInfo<void> {
  const LandingPage() : super(LandingPage.name, path: '');

  static const String name = 'LandingPage';
}

/// generated route for
/// [_i10.PostNewJob]
class PostNewJob extends _i2.PageRouteInfo<void> {
  const PostNewJob() : super(PostNewJob.name, path: '');

  static const String name = 'PostNewJob';
}

/// generated route for
/// [_i11.UpdateProfile]
class _UpdateProfileRoute extends _i2.PageRouteInfo<void> {
  const _UpdateProfileRoute() : super(_UpdateProfileRoute.name, path: '');

  static const String name = '_UpdateProfileRoute';
}

/// generated route for
/// [_i12.WorkspaceScreen]
class _WorkSpaceRoute extends _i2.PageRouteInfo<void> {
  const _WorkSpaceRoute() : super(_WorkSpaceRoute.name, path: '');

  static const String name = '_WorkSpaceRoute';
}

/// generated route for
/// [_i13.ProjectDetailsPage]
class _ProjectDetailsRoute extends _i2.PageRouteInfo<void> {
  const _ProjectDetailsRoute() : super(_ProjectDetailsRoute.name, path: '');

  static const String name = '_ProjectDetailsRoute';
}

/// generated route for
/// [_i14.DiscoverJobPage]
class DiscoverJobPage extends _i2.PageRouteInfo<void> {
  const DiscoverJobPage() : super(DiscoverJobPage.name, path: '');

  static const String name = 'DiscoverJobPage';
}

/// generated route for
/// [_i15.SignUp]
class SignUp extends _i2.PageRouteInfo<void> {
  const SignUp() : super(SignUp.name, path: '');

  static const String name = 'SignUp';
}

/// generated route for
/// [_i16.JobDetailsScreen]
class _JobDetailsRoute extends _i2.PageRouteInfo<void> {
  const _JobDetailsRoute() : super(_JobDetailsRoute.name, path: '');

  static const String name = '_JobDetailsRoute';
}
