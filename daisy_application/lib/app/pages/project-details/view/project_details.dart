import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/pages/project-details/model/project_details_state.dart';
import 'package:daisy_application/app/pages/project-details/view/component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ProjectDetailsState(),
            ),
          ],
          child: const ProjectDetailsBody(),
        ),
      ),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const BottomNavBar() : null,
    );
  }
}
