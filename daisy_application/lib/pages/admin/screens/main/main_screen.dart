import 'package:daisy_application/pages/admin/responsive.dart';
import 'package:daisy_application/pages/admin/screens/dashboard/dashboard_screen.dart';
import 'package:daisy_application/pages/admin/screens/main/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'components/side_menu.dart';

class AdminMainScreen extends StatelessWidget {
  const AdminMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            const Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const AdminBottomNavBar() : null,
    );
  }
}
