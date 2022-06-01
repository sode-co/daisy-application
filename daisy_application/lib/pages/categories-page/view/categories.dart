import 'package:daisy_application/pages/categories-page/view/mobile.dart';
import 'package:daisy_application/pages/categories-page/view/web.dart';
import 'package:daisy_application/pages/common/header.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/common/sidebar.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      drawer: !Responsive.isDesktop(context) ? const Sidebar() : null,
      body: Responsive.isDesktop(context)
          ? const SingleChildScrollView(child: BodyCategoriesPageWeb())
          : const SingleChildScrollView(child: BodyCategoriesPageMobile()),
    );
  }
}
