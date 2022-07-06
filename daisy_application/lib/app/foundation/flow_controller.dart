library flow_controller;

import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/router/admin_router.gr.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class FlowController extends AutoRouter {
  const FlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => FlowControllerState();
}

class FlowControllerState extends AutoRouterState {
  @override
  void initState() {
    super.initState();
  }

  ApplicationState get appState => context.read();

  Future<void> verifyRoute({
    bool autoRoute = true,
    bool requireAuth = false,
    UserRole? requireRole,
  }) async {
    bool isAuthenticated = appState.currentUser != null && appState.isLoggedIn;
    bool _requireAuth = requireAuth || requireRole != null;
    if (_requireAuth && !isAuthenticated) {
      await _doRoutingWhenVerifiedFailed();
      return;
    }

    UserModel currentUser = appState.currentUser!;
    if (requireRole != null && currentUser.role != requireRole.name) {
      await _doRoutingWhenVerifiedFailed();
      return;
    }
  }

  Future<void> _doRoutingWhenVerifiedFailed() async {
    final canPop = Navigator.canPop(context);
    if (canPop) {
      Navigator.of(context).pop();
      return;
    }

    // TODO: Should show the 404 page not found
    await context.pushRoute(const HomeRoute());
  }
}
