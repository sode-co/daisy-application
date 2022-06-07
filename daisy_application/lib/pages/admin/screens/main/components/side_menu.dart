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
    return Drawer(
      backgroundColor: primaryColor,
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
              children: const [
                DrawerItem(
                  icon: Icons.widgets,
                  content: 'Báo cáo tiến độ',
                  pageUrl: '/admin',
                ),
                DrawerItem(
                  icon: Icons.paid,
                  content: 'Quản lí giao dịch',
                  pageUrl: '/',
                ),
                DrawerItem(
                  icon: Icons.manage_accounts,
                  content: 'Quản lí tài khoản',
                  pageUrl: '/',
                ),
                DrawerItem(
                  icon: Icons.category,
                  content: 'Quản lí danh mục',
                  pageUrl: '/',
                ),
                DrawerItem(
                  icon: Icons.photo_library,
                  content: 'Quản lí sản phẩm',
                  pageUrl: '/',
                ),
                DrawerItem(
                  icon: Icons.business_center,
                  content: 'Quản lí dự án',
                  pageUrl: '/',
                ),
                DrawerItem(
                  icon: Icons.gavel,
                  content: 'Quản lí hợp đồng',
                  pageUrl: '/',
                ),
                DrawerItem(
                  icon: Icons.perm_phone_msg,
                  content: 'Hỗ trợ khách hàng',
                  pageUrl: '/',
                ),
                DrawerItem(
                  icon: Icons.feedback,
                  content: 'Xem phản hồi',
                  pageUrl: '/',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.content,
    required this.icon,
    required this.pageUrl,
  }) : super(key: key);

  final String content;
  final IconData icon;
  final String pageUrl;
  @override
  Widget build(BuildContext context) {
    double verticalPadding = Responsive.isDesktop(context) ? 15.0 : 5.0;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 10.0, vertical: verticalPadding),
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
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
