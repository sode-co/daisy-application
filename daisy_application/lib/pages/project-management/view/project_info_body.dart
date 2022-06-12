import 'package:daisy_application/pages/project-management/view/body.dart';
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
    return SizedBox(
      height: 1000,
      width: 200,
      child: Column(
        children: [
          Text(_project.name),
          Text(_project.category),
          Text(_project.description),
          Text(
            _project.budget.toString(),
          ),
        ],
      ),
    );
  }
}
