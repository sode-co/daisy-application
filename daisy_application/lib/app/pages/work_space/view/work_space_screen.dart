import 'dart:html';

import 'package:daisy_application/app/common/colors.dart';
import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/design/design_sidebar.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/listeners/WidgetListener.dart';
import 'package:daisy_application/app/pages/landing-page/view/common.dart';
import 'package:daisy_application/app/pages/project-details/model/project_details_state.dart';
import 'package:daisy_application/app/pages/work_space/deps/workspace_listener.dart';
import 'package:daisy_application/app/pages/work_space/model/workspace_screen_state.dart';
import 'package:daisy_application/app/pages/work_space/view/header_workspace.dart';
import 'package:daisy_application/app/pages/work_space/view/item_project.dart';
import 'package:daisy_application/app/pages/work_space/view/item_request.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/math_utils.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:dio/dio.dart';
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
                  size.width * (Responsive.isDesktop(context) ? 0.6 : 0.9),
                  max: 1400),
              child: Row(
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
        height: 800,
        child: SideBar(
          onTabChanged: _listener.onSelectedTabChanged,
          selectedTabIndex: _screenState.activeTab,
          items: [
            SideBarItem(label: 'Đơn đã nộp', icon: Icons.all_inbox_sharp),
            SideBarItem(label: 'Tất cả', icon: Icons.all_inbox_sharp),
            SideBarItem(
                label: 'Đang hoạt động', icon: Icons.work_history_sharp),
            SideBarItem(
                label: 'Hoàn thành', icon: Icons.document_scanner_outlined),
            SideBarItem(label: 'Đã hủy', icon: Icons.cancel),
          ],
        ),
      );

  List<Widget> _createContent() {
    switch (_screenState.activeTab) {
      case 0:
        return _createRequestTab(_screenState.allPendingRequests);
      case 1:
        return _createProjectTab(_screenState.allProjects);
      case 2:
        return _createProjectTab(_screenState.activeProjects);
      case 3:
        return _createProjectTab(_screenState.doneProjects);
      case 4:
        return _createProjectTab(_screenState.canceledProjects);
    }

    throw Exception('Unsupported tab with index ${_screenState.activeTab}');
  }

  Size get size => MediaQuery.of(context).size;

  List<Widget> _createRequestTab(List<RequestModel> items) => items
      .map((request) => SizedBox(
          width: size.width * (Responsive.isDesktop(context) ? 0.4 : 0.7),
          child: createRequestInfoCard(request)))
      .toList();

  List<Widget> _createProjectTab(List<ProjectModel> items) => items
      .map((project) => SizedBox(
          width: size.width * (Responsive.isDesktop(context) ? 0.4 : 0.7),
          child: createProjectInfoCard(project)))
      .toList();
}
