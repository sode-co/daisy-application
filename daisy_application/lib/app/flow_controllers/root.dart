import 'package:daisy_application/app/flow_controllers/authenticated/authenticcated_flow_controller.dart';
import 'package:daisy_application/app/flow_controllers/unauthenticated/unauthenticated_flow_controller.dart';
import 'package:daisy_application/app/foundation/pop_scope.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RootState();
}

class RootState extends State<RootPage>
    with PopScopeHost<RootPage>
    implements PopScopeHost<RootPage> {
  @override
  Widget build(BuildContext context) {
    ApplicationState appState = context.watch();
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
            body: appState.isLoggedIn
                ? const AuthenticatedFlowController()
                : const AuthenticatedFlowController()));
  }
}
