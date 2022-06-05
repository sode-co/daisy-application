import 'package:daisy_application/pages/common/bottomnavbar.dart';
import 'package:daisy_application/pages/common/header.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:flutter/material.dart';

class DiscoveryPage extends StatelessWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: const Text('Discovery'),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const BottomNavBar() : null,
    );
  }
}
