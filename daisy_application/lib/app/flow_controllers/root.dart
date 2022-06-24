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
  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    final appState = ApplicationState();
    _isLoggedIn = appState.isLoggedIn;
    return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
            body: MultiProvider(
          providers: [ChangeNotifierProvider(create: (ctx) => appState)],
          child: _isLoggedIn
              ? const AuthenticatedFlowController()
              : const UnAuthenticatedFlowController(),
        )));
  }
}
