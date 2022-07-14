import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/pages/project-details/deps/project_details_listener.dart';
import 'package:daisy_application/app/pages/project-details/model/project_details_state.dart';
import 'package:daisy_application/core_services/models/discussion/discussion_model.dart';
import 'package:daisy_application/core_services/socket/discussions/discussion_signalr_client.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectDetailsFlowController extends AutoRouter {
  const ProjectDetailsFlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => _ProjectDetailsFlowControllerState();
}

class _ProjectDetailsFlowControllerState extends AutoRouterState
    implements ProjectDetailsListener<AutoRouter> {
  ProjectDetailsState? projectDetailsState;
  late DiscussionSignalRClient _discussionRealtimeService;

  ProjectDetailsState get screenState => context.read();

  @override
  void initState() {
    super.initState();
    _discussionRealtimeService =
        locator.get(param1: screenState.project!.workspaces);
    projectDetailsState = ProjectDetailsState();
    _discussionRealtimeService.connect();
  }

  Future<void> streamingDiscussion(DiscussionModel discussion) async {
    await for (var discussion
        in _discussionRealtimeService.streamNewMessages()) {
      screenState.addDiscussions([discussion]);
    }
  }

  @override
  void dispose() {
    _discussionRealtimeService.end();
    projectDetailsState = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProjectDetailsState>(
            create: (ctx) => projectDetailsState!)
      ],
      child: super.build(context),
    );
  }

  @override
  void onFileNavTabSelected(int index) {
    // TODO: implement onFileNavTabSelected
  }
}
