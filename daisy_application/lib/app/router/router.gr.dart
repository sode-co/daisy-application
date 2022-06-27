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
import 'package:flutter/material.dart' as _i10;

import '../flow_controllers/discovery_job/discovery_job_flow_controller.dart'
    as _i4;
import '../flow_controllers/post_new_job/post_new_job_flow_controller.dart'
    as _i3;
import '../flow_controllers/root/root.dart' as _i1;
import '../flow_controllers/signup/signup_flow_controller.dart' as _i5;
import '../pages/discovery-job/view/discovery_job_page.dart' as _i8;
import '../pages/landing-page/view/landing.dart' as _i6;
import '../pages/post-new-job/view/post_new_job.dart' as _i7;
import '../pages/signup-page/view/signup.dart' as _i9;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
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
    DicoveryJobRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DicoveryJobFlowController());
    },
    SignupRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.SignupFlowController());
    },
    LandingPage.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.LandingPage());
    },
    PostNewJob.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.PostNewJob());
    },
    DiscoverJobPage.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.DiscoverJobPage());
    },
    SignUp.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SignUp());
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
/// [_i4.DicoveryJobFlowController]
class DicoveryJobRoute extends _i2.PageRouteInfo<void> {
  const DicoveryJobRoute({List<_i2.PageRouteInfo>? children})
      : super(DicoveryJobRoute.name,
            path: 'discovery', initialChildren: children);

  static const String name = 'DicoveryJobRoute';
}

/// generated route for
/// [_i5.SignupFlowController]
class SignupRoute extends _i2.PageRouteInfo<void> {
  const SignupRoute({List<_i2.PageRouteInfo>? children})
      : super(SignupRoute.name, path: 'signup', initialChildren: children);

  static const String name = 'SignupRoute';
}

/// generated route for
/// [_i6.LandingPage]
class LandingPage extends _i2.PageRouteInfo<void> {
  const LandingPage() : super(LandingPage.name, path: '');

  static const String name = 'LandingPage';
}

/// generated route for
/// [_i7.PostNewJob]
class PostNewJob extends _i2.PageRouteInfo<void> {
  const PostNewJob() : super(PostNewJob.name, path: '');

  static const String name = 'PostNewJob';
}

/// generated route for
/// [_i8.DiscoverJobPage]
class DiscoverJobPage extends _i2.PageRouteInfo<void> {
  const DiscoverJobPage() : super(DiscoverJobPage.name, path: '');

  static const String name = 'DiscoverJobPage';
}

/// generated route for
/// [_i9.SignUp]
class SignUp extends _i2.PageRouteInfo<void> {
  const SignUp() : super(SignUp.name, path: '');

  static const String name = 'SignUp';
}
