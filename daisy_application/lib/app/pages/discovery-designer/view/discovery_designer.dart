import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/listeners/WidgetListener.dart';
import 'package:daisy_application/app/pages/admin/screens/dashboard/components/header.dart';
import 'package:daisy_application/app/pages/discovery-designer/view/components.dart';
import 'package:flutter/material.dart';

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
      body: const SingleChildScrollView(
        child: DiscoverDesignerBody(),
      ),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const BottomNavBar() : null,
    );
  }
}
