import 'package:daisy_application/app/pages/admin/project-management/model/project_management_state.dart';
import 'package:daisy_application/app/pages/admin/project-management/view/body.dart';
import 'package:daisy_application/app/pages/admin/project-management/view/project_info_body.dart';
import 'package:daisy_application/app/pages/admin/responsive.dart';
import 'package:daisy_application/app/pages/admin/screens/main/components/bottom_nav_bar.dart';
import 'package:daisy_application/app/pages/admin/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectInfoManagement extends StatefulWidget {
  const ProjectInfoManagement({Key? key, required this.project})
      : super(key: key);
  final Project project;

  @override
  State<ProjectInfoManagement> createState() =>
      _ProjectInfoManagementState(project);
}

class _ProjectInfoManagementState extends State<ProjectInfoManagement> {
  late Project _project;
  _ProjectInfoManagementState(project) {
    _project = project;
  }

  @override
  Widget build(BuildContext context) {
    var model = context.read<ProjectManagementState>();

    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // We want this side menu only for large screen
          if (Responsive.isDesktop(context))
            const Expanded(
              // default flex = 1
              // and it takes 1/6 part of the screen
              child: SideMenu(),
            ),
          Expanded(
            // It takes 5/6 part of the screen
            flex: 5,
            child: ProjectInfoBody(
              project: _project,
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const AdminBottomNavBar() : null,
    );
  }
}
