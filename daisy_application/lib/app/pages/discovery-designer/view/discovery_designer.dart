import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/listeners/WidgetListener.dart';
import 'package:daisy_application/app/pages/discovery-designer/view/components.dart';
import 'package:daisy_application/app/pages/project-details/model/project_details_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactAndProject extends StatefulWidget {
  const ContactAndProject({Key? key}) : super(key: key);

  @override
  State<ContactAndProject> createState() => _ContactAndProjectState();
}

class _ContactAndProjectState extends State<ContactAndProject>
    with WidgetListener {
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
          child: const DiscoverDesignerBody(),
        ),
      ),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const BottomNavBar() : null,
    );
  }
}
