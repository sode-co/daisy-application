import 'package:daisy_application/pages/admin/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';

class ProjectManagementBody extends StatefulWidget {
  const ProjectManagementBody({Key? key}) : super(key: key);

  @override
  State<ProjectManagementBody> createState() => _ProjectManagementBodyState();
}

class _ProjectManagementBodyState extends State<ProjectManagementBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        child: Column(
          children: const [
            Header(),
          ],
        ),
      ),
    );
  }
}
