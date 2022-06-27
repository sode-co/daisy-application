import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/flow_controllers/root/unauthenticated_flow_controller.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authenticated_flow_controller.dart';

class RootFlowController extends AutoRouter {
  const RootFlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => RootFlowControllerState();
}

class RootFlowControllerState extends AutoRouterState {
  @override
  Widget build(BuildContext context) {
    ApplicationState appState = context.watch();
    return appState.isLoggedIn
        ? AuthenticatedFlowController(child: super.build(context))
        : UnAuthenticatedFlowController(child: super.build(context));
  }
}
