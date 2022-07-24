import 'package:daisy_application/app/common/colors.dart';
import 'package:daisy_application/app/pages/admin/project-management/view/body.dart';
import 'package:daisy_application/app/pages/admin/project-management/view/project_info_update_form.dart';
import 'package:daisy_application/app/pages/admin/responsive.dart';
import 'package:daisy_application/app/pages/admin/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';

class ProjectInfoBody extends StatefulWidget {
  const ProjectInfoBody({Key? key, required this.project}) : super(key: key);
  final Project project;
  @override
  State<ProjectInfoBody> createState() => _ProjectInfoBodyState(project);
}

class _ProjectInfoBodyState extends State<ProjectInfoBody> {
  late Project _project;
  _ProjectInfoBodyState(Project project) {
    _project = project;
  }

  @override
  Widget build(BuildContext context) {
    var horizontalPadding = Responsive.isDesktop(context) ? 20.0 : 0.0;
    var verticalPadding = Responsive.isDesktop(context) ? 25.0 : 5.0;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: verticalPadding),
                child: Column(
                  children: [
                    Text(
                      'Thông tin dự án ${_project.name}',
                      style: const TextStyle(
                          fontSize: 16.5,
                          fontWeight: FontWeight.w600,
                          color: Color(BuiltinColor.blue_gradient_01)),
                    ),
                    SizedBox(height: verticalPadding),
                    ProjectInfoUpdateForm(
                      project: _project,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
