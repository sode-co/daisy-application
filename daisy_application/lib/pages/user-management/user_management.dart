import 'package:daisy_application/pages/admin/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key}) : super(key: key);

  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: SingleChildScrollView(
    //     primary: false,
    //     padding: const EdgeInsets.all(defaultPadding),
    //     child: Column(
    //       children: const [
    //         Header(),
    //         SizedBox(height: defaultPadding),
    //         Text('User management'),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: const Header(),
      body: Text('User management'),
    );
  }
}
