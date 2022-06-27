import 'package:daisy_application/app/pages/admin/responsive.dart';
import 'package:daisy_application/app/pages/admin/screens/main/components/bottom_nav_bar.dart';
import 'package:daisy_application/app/pages/admin/screens/main/components/side_menu.dart';
import 'package:daisy_application/app/pages/admin/user-management/model/user_management_state.dart';
import 'package:daisy_application/app/pages/admin/user-management/view/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  @override
  Widget build(BuildContext context) {
    var model = context.read<UserManagementState>();

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
          const Expanded(
            // It takes 5/6 part of the screen
            flex: 5,
            child: UserManagementBody(),
          ),
        ],
      ),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const AdminBottomNavBar() : null,
    );
  }
}
