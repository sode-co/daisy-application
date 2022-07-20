import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/pages/portfolio/deps/portfolio_listener.dart';
import 'package:daisy_application/app/pages/portfolio/model/portfolio_state.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/core_services/models/portfolio/portfolio_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PortfolioFlowController extends AutoRouter {
  const PortfolioFlowController({Key? key, this.portfolio}) : super(key: key);
  final PortfolioModel? portfolio;

  @override
  AutoRouterState createState() => _PortfolioFlowControllerState();
}

class _PortfolioFlowControllerState extends AutoRouterState
    implements PortfolioListener<AutoRouter> {
  PortfolioState? portfolioState;

  PortfolioFlowController get myWidget => widget as PortfolioFlowController;

  @override
  void initState() {
    super.initState();
    portfolioState = PortfolioState();
    portfolioState!.portfolio = myWidget.portfolio;
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
        ChangeNotifierProvider<PortfolioState>(create: (ctx) => portfolioState!)
      ],
      child: super.build(context),
    );
  }
}
