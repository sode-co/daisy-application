import 'package:daisy_application/pages/admin/constants.dart';
import 'package:daisy_application/pages/admin/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = Responsive.isDesktop(context) ? 16.0 : 38.0;

    return Drawer(
      backgroundColor: primaryColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/admin_logo.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: const DrawerItem(
                      icon: Icons.widgets,
                      content: 'Tổng quan',
                      pageUrl: '/admin',
                    ),
                  ),
                  ExpansionTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: const DrawerItem(
                      icon: Icons.business_center,
                      content: 'Quản lí dự án       ',
                      pageUrl: '/project-management',
                    ),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          DrawerItem(
                            content: 'Giao dịch',
                            pageUrl: '/',
                          ),
                          DrawerItem(
                            content: 'Dự án mới',
                            pageUrl: '/',
                          ),
                          DrawerItem(
                            content: 'Dự án đã hoàn thành',
                            pageUrl: '/',
                          ),
                        ],
                      )
                    ],
                  ),
                  ExpansionTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: const DrawerItem(
                      icon: Icons.manage_accounts,
                      content: 'Quản lí tài khoản',
                      pageUrl: '/user-management',
                    ),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          DrawerItem(
                            pageUrl: '/designer',
                            content: 'Nhà thiết kế        ',
                          ),
                          DrawerItem(
                            pageUrl: '/customer',
                            content: 'Khách hàng          ',
                          ),
                          DrawerItem(
                            pageUrl: '/admin',
                            content: 'Quản trị viên          ',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: const DrawerItem(
                      icon: Icons.photo_library,
                      content: 'Quản lí sản phẩm',
                      pageUrl: '/',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: const DrawerItem(
                      icon: Icons.category,
                      content: 'Quản lí danh mục',
                      pageUrl: '/',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: const DrawerItem(
                      icon: Icons.perm_phone_msg,
                      content: 'Hỗ trợ khách hàng',
                      pageUrl: '/',
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: const DrawerItem(
                      icon: Icons.feedback,
                      content: 'Xem phản hồi',
                      pageUrl: '/',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.content,
    this.icon,
    required this.pageUrl,
  }) : super(key: key);

  final String content;
  final IconData? icon;
  final String pageUrl;
  @override
  Widget build(BuildContext context) {
    double verticalPadding = Responsive.isDesktop(context) ? 15.0 : 5.0;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 0),
      child: TextButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(
          content,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              fontFamily: 'Roboto'),
        ),
        onPressed: () {
          print('test');
          Navigator.pushNamed(context, pageUrl);
        },
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
