import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/pages/project-details/deps/project_details_listener.dart';
import 'package:daisy_application/app/pages/project-details/model/project_details_state.dart';
import 'package:daisy_application/app/pages/project-details/view/discussions/project_discussion.dart';
import 'package:daisy_application/app/pages/project-details/view/files/project_files_management.dart';
import 'package:daisy_application/app/pages/project-details/view/overview/project_overview.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/socket/discussions/discussion_signalr_client.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:daisy_application/app/pages/project-details/view/project_header.dart';
import 'package:provider/provider.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProjectDetailsPage> createState() => ProjectDetailsPageState();
}

class ProjectDetailsPageState extends State<ProjectDetailsPage> {
  late PageController filePageController;
  late DiscussionSignalRClient discussionService;

  @override
  initState() {
    super.initState();
    Debug.log('recreate file page controller');
    discussionService =
        locator.get(param1: screenState.project!.workspaces.first);

    discussionService.connect().then((value) async {
      await for (var discussion in discussionService.streamNewMessages()) {
        Debug.log('receiving new message', discussion);
      }
    });
    filePageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    discussionService.end();
    super.dispose();
  }

  ApplicationState get appState => context.read();
  ProjectDetailsState get screenState => context.read();
  ProjectDetailsListener get listener => context.findAncestorStateOfType()!;

  @override
  Widget build(BuildContext context) {
    context.watch<ProjectDetailsState>();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
                backgroundColor: Design.headerColor,
                floating: true,
                snap: true,
                pinned: true,
                flexibleSpace: DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Container(
                      color: Colors.white,
                      child: const Header(color: Design.headerColor),
                    ),
                  ),
                ),
                leadingWidth: double.infinity,
                bottom: createBodyAndTabar())
          ],
          body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Design.alignmentSpacing(context),
                vertical: Design.headerSpacing),
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                createProjectOverViewTab(),
                createProjectDiscussionTab(),
                createProjectFileManagementTab(),
                buildTestBody('Settings')
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            !Responsive.isDesktop(context) ? const BottomNavBar() : null,
      ),
    );
  }

  PreferredSize createBodyAndTabar() => PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 130),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
              vertical: 10, horizontal: Design.alignmentSpacing(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Design.bodySpacing),
              createHeader(),
              const SizedBox(height: Design.contentSpacing),
              Responsive.isDesktop(context)
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (Responsive.isDesktop(context))
                          Container(
                            alignment: Alignment.topLeft,
                            height: 25,
                            width: 5,
                            color: Design.colorPrimary,
                          ),
                        createTabBar()
                      ],
                    )
                  : createTabBar(),
            ],
          ),
        ),
      );

  Widget createTabBar() {
    return TabBar(
      isScrollable: !Responsive.isMobile(context),
      indicatorColor: Design.colorBlack,
      indicatorWeight: 5,
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
      tabs: [
        createTab('Overview'),
        createTab('Discussion'),
        createTab('Files'),
        createTab('Payment')
      ],
    );
  }

  Widget createTab(String title) => Container(
        alignment: Alignment.centerLeft,
        child: Tab(
            icon: Text(title,
                textAlign: TextAlign.start,
                style: Design.textBodyFold(
                    isMobile: !Responsive.isDesktop(context)))),
      );

  Widget buildTestBody(String text) => ListView.separated(
        itemBuilder: (ctx, index) => Text(
          'Item $index',
          style: Design.textTitle(),
        ),
        separatorBuilder: (ctx, index) => const SizedBox(height: 30),
        itemCount: 25,
      );
}
