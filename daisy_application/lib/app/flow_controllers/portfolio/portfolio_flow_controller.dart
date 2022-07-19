import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/pages/portfolio/deps/portfolio_listener.dart';
import 'package:daisy_application/app/pages/portfolio/model/portfolio_state.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/core_services/grpc/discussions/discussions_grpc_client.dart';
import 'package:daisy_application/core_services/http/project/project_rest_api.dart';
import 'package:daisy_application/core_services/models/portfolio/portfolio_model.dart';
import 'package:daisy_application/core_services/socket/discussions/discussion_signalr_client.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PortfolioFlowController extends AutoRouter {
  const PortfolioFlowController(this.portfolio, {Key? key}) : super(key: key);
  final PortfolioModel? portfolio;

  @override
  AutoRouterState createState() => _PortfolioFlowControllerState();
}

class _PortfolioFlowControllerState extends AutoRouterState
    implements PortfolioListener<AutoRouter> {
  PortfolioState? projectDetailsState;
  late ProjectRestApi projectApiSerivce;
  late DiscussionsGrpcClient _discussionsGrpcService;
  late DiscussionSignalRClient _discussionRealtimeService;

  PortfolioFlowController get myWidget => widget as PortfolioFlowController;

  @override
  void initState() {
    super.initState();
    _discussionsGrpcService = locator.get();
    projectApiSerivce = locator.get();
    projectDetailsState = PortfolioState();
    _discussionRealtimeService = locator.get();
  }

  ApplicationState get appState => context.read();

  @override
  void dispose() {
    _discussionRealtimeService.end();
    // projectDetailsState = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PortfolioState>(
            create: (ctx) => projectDetailsState!)
      ],
      child: super.build(context),
    );
  }
}
