import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/pages/project-details/deps/project_details_listener.dart';
import 'package:daisy_application/app/pages/project-details/model/project_details_state.dart';
import 'package:flutter/material.dart';

class ProjectDetailsFlowController extends AutoRouter {
  const ProjectDetailsFlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => _ProjectDetailsFlowControllerState();
}

class _ProjectDetailsFlowControllerState extends AutoRouterState
    implements ProjectDetailsListener<AutoRouter> {
  ProjectDetailsState? projectDetailsState;
  @override
  void initState() {
    projectDetailsState = ProjectDetailsState();
    super.initState();
  }

  @override
  void dispose() {
    projectDetailsState = null;
    super.dispose();
  }
}
