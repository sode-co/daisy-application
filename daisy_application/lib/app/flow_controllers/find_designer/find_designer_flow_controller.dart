import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/pages/find-designer/deps/find_designer_page_deps.dart';
import 'package:daisy_application/app/pages/find-designer/model/find_designer_page_state.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FindDesignerFlowController extends AutoRouter {
  const FindDesignerFlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => _FindDesignerFlowControllerState();
}

class _FindDesignerFlowControllerState extends AutoRouterState
    implements FindDesignerListener<AutoRouter> {
  FindDesignerPageState? findDesignerState;

  FindDesignerFlowController get myWidget =>
      widget as FindDesignerFlowController;

  @override
  void initState() {
    super.initState();
    findDesignerState = FindDesignerPageState();
  }

  ApplicationState get appState => context.read();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FindDesignerPageState>(
            create: (ctx) => findDesignerState!)
      ],
      child: super.build(context),
    );
  }
}
