import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/design/design_sidebar.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/listeners/WidgetListener.dart';
import 'package:daisy_application/app/pages/landing-page/view/common.dart';
import 'package:daisy_application/app/pages/work_space/deps/workspace_listener.dart';
import 'package:daisy_application/app/pages/work_space/model/workspace_screen_state.dart';
import 'package:daisy_application/app/pages/work_space/model/workspace_tabs.dart';
import 'package:daisy_application/app/pages/work_space/view/header_workspace.dart';
import 'package:daisy_application/app/pages/work_space/view/item_project.dart';
import 'package:daisy_application/app/pages/work_space/view/item_request.dart';
import 'package:daisy_application/app/pages/work_space/view/workspace_common.dart';
import 'package:daisy_application/app/router/router.gr.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/math_utils.dart';
import 'package:daisy_application/common/name_to_enum.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkspaceScreen extends StatefulWidget {
  const WorkspaceScreen({Key? key}) : super(key: key);

  @override
  State<WorkspaceScreen> createState() => WorkspaceState();
}

class WorkspaceState extends State<WorkspaceScreen>
    with WidgetListener, TickerProviderStateMixin {
  @override
  initState() {
    super.initState();
  }

  WorkSpaceScreenState get _screenState => context.watch();
  WorkSpaceListener get _listener => context.findAncestorStateOfType()!;

  @override
  Widget build(BuildContext context) {
    WorkSpaceScreenState screenState = context.watch();
    return Scaffold(
      backgroundColor: Design.colorWhite,
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (Responsive.isDesktop(context)) createWorkspaceHeader(),
            const SizedBox(height: Design.headerSpacing),
            Container(
              padding: const EdgeInsets.only(
                  left: Design.headerSpacing * 2, top: Design.headerSpacing),
              child: Row(
                children: [
                  Text(
                    'Your work',
                    textAlign: TextAlign.left,
                    style: Design.textLogo(
                      textColor: Design.colorNeutral.shade900,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: limit(
                  size.width * (Responsive.isDesktop(context) ? 0.65 : 1),
                  max: 1200),
              child: Responsive.isDesktop(context)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _createSideBar(),
                        Expanded(child: Container()),
                        Column(
                          children: [
                            ..._createContent(),
                            const SizedBox(height: Design.headerSpacing * 4)
                          ],
                        )
                      ],
                    )
                  : Column(
                      children: [
                        RotatedBox(quarterTurns: 3, child: _createSideBar()),
                        ..._createContent(),
                        const SizedBox(height: Design.headerSpacing * 4)
                      ],
                    ),
            ),
            if (Responsive.isDesktop(context))
              Container(
                padding: const EdgeInsets.only(
                    bottom: Design.headerSpacing,
                    top: Design.headerSpacing * 4),
                color: Design.headerColor,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [FooterComponent.renderResourceFooter()]),
              )
          ],
        ),
      ),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const BottomNavBar() : null,
    );
  }

  ApplicationState get appState => context.read();

  UserModel get currentUser => appState.currentUser!;

  Widget _createSideBar() => SizedBox(
        height: 400,
        width: 220,
        child: SideBar(
          onTabChanged: (index) =>
              _listener.onSelectedTabChanged(getTab(index)),
          selectedTabIndex: getTabIndex(_screenState.activeTab),
          items: [
            SideBarItem(
                label: currentUser.role!.toUserRole() == UserRole.CUSTOMER
                    ? getTabDisplayName(WorkspaceTab.PostedRequest)
                    : getTabDisplayName(WorkspaceTab.AppliedRequest),
                icon: Icons.all_inbox_sharp,
                rotate: getRotationByPlatform()),
            SideBarItem(
                label: getTabDisplayName(WorkspaceTab.AllProjects),
                icon: Icons.indeterminate_check_box_rounded,
                rotate: getRotationByPlatform()),
            SideBarItem(
                label: getTabDisplayName(WorkspaceTab.ActiveProjects),
                icon: Icons.work_history_sharp,
                rotate: getRotationByPlatform()),
            SideBarItem(
                label: getTabDisplayName(WorkspaceTab.DoneProjects),
                icon: Icons.document_scanner_outlined,
                rotate: getRotationByPlatform()),
            SideBarItem(
                label: getTabDisplayName(WorkspaceTab.CanceledProjects),
                icon: Icons.cancel,
                rotate: getRotationByPlatform()),
          ],
        ),
      );

  int getRotationByPlatform() => Responsive.isDesktop(context) ? 1 : 1;

  List<Widget> _createContent() {
    switch (_screenState.activeTab) {
      case WorkspaceTab.AppliedRequest:
        return _createRequestTab(_screenState.allPendingRequests);
      case WorkspaceTab.PostedRequest:
        return _createRequestTab(_screenState.allPostedRequests);
      case WorkspaceTab.AllProjects:
        return _createProjectTab(_screenState.allProjects);
      case WorkspaceTab.ActiveProjects:
        return _createProjectTab(_screenState.activeProjects);
      case WorkspaceTab.CanceledProjects:
        return _createProjectTab(_screenState.canceledProjects);
      case WorkspaceTab.DoneProjects:
        return _createProjectTab(_screenState.doneProjects);
    }
  }

  Size get size => MediaQuery.of(context).size;

  List<Widget> _createRequestTab(List<RequestModel> items) => items.isNotEmpty
      ? items
          .map((request) => SizedBox(
              width: size.width * (Responsive.isDesktop(context) ? 0.4 : 0.7),
              child: createRequestInfoCard(request)))
          .toList()
      : [getEmptyMessageByTab(_screenState.activeTab)];

  List<Widget> _createProjectTab(List<ProjectModel> items) => items.isNotEmpty
      ? items
          .map((project) => SizedBox(
              width: size.width * (Responsive.isDesktop(context) ? 0.5 : 0.7),
              child: createProjectInfoCard(project,
                  onItemSelected: ((p0) => context.router.push(
                      ProjectDetailsRoute(projectId: p0.id.toString()))))))
          .toList()
      : [getEmptyMessageByTab(_screenState.activeTab)];
}
