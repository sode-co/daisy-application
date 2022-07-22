import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/pages/find-designer/deps/find_designer_page_deps.dart';
import 'package:daisy_application/app/pages/find-designer/model/find_designer_page_state.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/core_services/http/artwork/artwork_rest_api.dart';
import 'package:daisy_application/core_services/http/portfolio/portfolio_rest_api.dart';
import 'package:daisy_application/core_services/http/users/users_rest_api.dart';
import 'package:daisy_application/core_services/models/artwork/artwork_model.dart';
import 'package:daisy_application/core_services/models/portfolio/portfolio_model.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FindDesignerFlowController extends AutoRouter {
  const FindDesignerFlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => _FindDesignerFlowControllerState();
}

class _FindDesignerFlowControllerState extends AutoRouterState
    implements FindDesignerListener<AutoRouter> {
  FindDesigneScreenState? findDesignerState;
  late UsersRestApi _usersRestApi;
  late ArtworkRestApi _artworkRestApi;
  late PortfolioRestApi _portfolioRestApi;

  FindDesignerFlowController get myWidget =>
      widget as FindDesignerFlowController;

  @override
  void initState() {
    super.initState();
    _usersRestApi = locator.get();
    _artworkRestApi = locator.get();
    _portfolioRestApi = locator.get();
    findDesignerState = FindDesigneScreenState();
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
        ChangeNotifierProvider<FindDesigneScreenState>(
            create: (ctx) => findDesignerState!)
      ],
      child: super.build(context),
    );
  }

  @override
  Future<void> onSearchDesignersByCategoryId(int id) async {
    var result = await _usersRestApi.getDesignersByCategoryId(id);
    findDesignerState?.designers = result.data;
  }

  @override
  Future<ArtworkModel> onGetLatestArtwork(String designerEmail) async {
    var result =
        await _artworkRestApi.getLatestArtworkByDesignerEmail(designerEmail);
    return result.data;
  }

  @override
  Future<PortfolioModel> getPortfolioByDesignerEmail(
      String designerEmail) async {
    var result = await _portfolioRestApi.getByDesignerEmail(designerEmail);
    return result.data;
  }
}
