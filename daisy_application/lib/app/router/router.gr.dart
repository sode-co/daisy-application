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
import 'package:flutter/material.dart' as _i14;

import '../flow_controllers/contact_and_project/contact_and_project_controller.dart'
    as _i5;
import '../flow_controllers/discovery_job/discovery_job_flow_controller.dart'
    as _i6;
import '../flow_controllers/post_new_job/post_new_job_flow_controller.dart'
    as _i3;
import '../flow_controllers/root/root.dart' as _i1;
import '../flow_controllers/signup/signup_flow_controller.dart' as _i7;
import '../flow_controllers/update_profile/update_profile_controller.dart'
    as _i4;
import '../pages/discovery-designer/view/discovery_designer.dart' as _i11;
import '../pages/discovery-job/view/discovery_job_page.dart' as _i12;
import '../pages/landing-page/view/landing.dart' as _i8;
import '../pages/post-new-job/view/post_new_job.dart' as _i9;
import '../pages/signup-page/view/signup.dart' as _i13;
import '../pages/update-profile/view/update_profile.dart' as _i10;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
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
    ContactAndProjectRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i5.ContactAndProjectFlowController());
    },
    DicoveryJobRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.DicoveryJobFlowController());
    },
    SignupRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.SignupFlowController());
    },
    LandingPage.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.LandingPage());
    },
    PostNewJob.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.PostNewJob());
    },
    _UpdateProfileRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.UpdateProfile());
    },
    _ContactAndProjectRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.ContactAndProject());
    },
    DiscoverJobPage.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.DiscoverJobPage());
    },
    SignUp.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.SignUp());
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
          _i2.RouteConfig(ContactAndProjectRoute.name,
              path: 'contact-and-project',
              parent: RootRoute.name,
              children: [
                _i2.RouteConfig(_ContactAndProjectRoute.name,
                    path: '', parent: ContactAndProjectRoute.name)
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
/// [_i5.ContactAndProjectFlowController]
class ContactAndProjectRoute extends _i2.PageRouteInfo<void> {
  const ContactAndProjectRoute({List<_i2.PageRouteInfo>? children})
      : super(ContactAndProjectRoute.name,
            path: 'contact-and-project', initialChildren: children);

  static const String name = 'ContactAndProjectRoute';
}

/// generated route for
/// [_i6.DicoveryJobFlowController]
class DicoveryJobRoute extends _i2.PageRouteInfo<void> {
  const DicoveryJobRoute({List<_i2.PageRouteInfo>? children})
      : super(DicoveryJobRoute.name,
            path: 'discovery', initialChildren: children);

  static const String name = 'DicoveryJobRoute';
}

/// generated route for
/// [_i7.SignupFlowController]
class SignupRoute extends _i2.PageRouteInfo<void> {
  const SignupRoute({List<_i2.PageRouteInfo>? children})
      : super(SignupRoute.name, path: 'signup', initialChildren: children);

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i8.LandingPage]
class LandingPage extends _i2.PageRouteInfo<void> {
  const LandingPage() : super(LandingPage.name, path: '');

  static const String name = 'LandingPage';
}

/// generated route for
/// [_i9.PostNewJob]
class PostNewJob extends _i2.PageRouteInfo<void> {
  const PostNewJob() : super(PostNewJob.name, path: '');

  static const String name = 'PostNewJob';
}

/// generated route for
/// [_i10.UpdateProfile]
class _UpdateProfileRoute extends _i2.PageRouteInfo<void> {
  const _UpdateProfileRoute() : super(_UpdateProfileRoute.name, path: '');

  static const String name = '_UpdateProfileRoute';
}

/// generated route for
/// [_i11.ContactAndProject]
class _ContactAndProjectRoute extends _i2.PageRouteInfo<void> {
  const _ContactAndProjectRoute()
      : super(_ContactAndProjectRoute.name, path: '');

  static const String name = '_ContactAndProjectRoute';
}

/// generated route for
/// [_i12.DiscoverJobPage]
class DiscoverJobPage extends _i2.PageRouteInfo<void> {
  const DiscoverJobPage() : super(DiscoverJobPage.name, path: '');

  static const String name = 'DiscoverJobPage';
}

/// generated route for
/// [_i13.SignUp]
class SignUp extends _i2.PageRouteInfo<void> {
  const SignUp() : super(SignUp.name, path: '');

  static const String name = 'SignUp';
}
