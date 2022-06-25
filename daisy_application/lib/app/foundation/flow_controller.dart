library flow_controller;

import 'package:daisy_application/app/flow_controllers/post_new_job/post_new_job_flow_controller.dart';
import 'package:daisy_application/app/foundation/routes.dart';
import 'package:daisy_application/app/pages/post-new-job/view/post_new_job.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pop_scope.dart';

class AppPage {
  final String name;
  final Widget widget;

  AppPage(this.name, this.widget);
}

abstract class FlowControllerState<T extends StatefulWidget> extends State<T>
    implements BackPressHandler<T> {
  late GlobalKey<NavigatorState> _navKey;
  PopScopeHostSubscription? _popScopeHostSubscription;
  late RouteObserver _routeObserver;

  List<String> _navStack = [];

  FlowControllerState();

  @override
  void initState() {
    super.initState();
    _navStack = [];
    _navKey = GlobalObjectKey<NavigatorState>(this);
    _routeObserver = RouteObserver();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _popScopeHostSubscription?.dispose();
    _popScopeHostSubscription = PopScopeHost.subscribe(context, this);
  }

  @override
  void dispose() {
    _popScopeHostSubscription?.dispose();
    super.dispose();
  }

  AppPage createInitialPage();
  List<ChangeNotifierProvider> createInitialProviders() => [];
  FluroRouter createInitialRoute();

  @override
  bool handleBackPressed() {
    final nav = _navigator();
    if (nav.canPop()) {
      nav.pop();
      return true;
    } else {
      return false;
    }
  }

  @override
  void onBackPressed() {
    if (!handleBackPressed()) {
      BackPressHandler parentHandler =
          context.findAncestorStateOfType<BackPressHandler>()!;
      parentHandler.onBackPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final widget = Navigator(
        key: _navKey,
        observers: [_routeObserver],
        initialRoute: '',
        onGenerateRoute: (settings) {
          final route = createInitialRoute().generator(settings);

          if (settings.name == PostNewJobFlowController.RouteName) {
            return MaterialPageRoute(
                settings: settings, builder: (context) => PostNewJob());
          } else {
            return route;
          }
        });
    final providers = createInitialProviders();
    return providers.isEmpty
        ? widget
        : MultiProvider(
            providers: providers,
            child: widget,
          );
  }

  void pushName(String name) {
    createInitialRoute().navigateTo(_navKey.currentContext!, name);
  }

  void pushSimple(Widget Function() builder, String name) {
    push(_buildRoute((c) => builder(), name));
  }

  void pop<T>({required T result}) {
    _navStack.removeLast();
    _navigator().pop(result);
  }

  Future<R?> push<R>(Route<R> route) {
    assert(route.settings.name != null);
    _navStack.add(route.settings.name!);
    return _navigator().push(route);
  }

  void popUntilFound(String name) {
    _navigator().popUntil((route) {
      final willPop = route.settings.name != name;
      if (willPop) _navStack.removeLast();
      return !willPop;
    });
  }

  Future<T?> pushAndRemoveUntil<T extends Object>(
      Route<T> route, RoutePredicate predicate) {
    return _navigator().pushAndRemoveUntil(route, (route) {
      final willPop = !predicate(route);
      if (willPop) {
        _navStack.removeLast();
      } else {
        _navStack.add(route.settings.name!);
      }
      return !willPop;
    });
  }

  ApplicationState get appState => context.read();

  bool canPop() => _navigator().canPop();

  bool containsChild(String routeName) =>
      _navStack.any((element) => element == routeName);

  bool isDisplayed(String routeName) => _navStack.last == routeName;

  RouteObserver routeObserver() => _routeObserver;

  NavigatorState _navigator() => _navKey.currentState!;

  Route<R> _buildRoute<R>(WidgetBuilder builder, String name) {
    return MaterialPageRoute(
        builder: builder, settings: RouteSettings(name: name));
  }
}
