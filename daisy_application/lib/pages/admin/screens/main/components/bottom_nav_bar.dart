import 'package:daisy_application/pages/admin/controllers/MenuController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminBottomNavBar extends StatelessWidget {
  const AdminBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ],
      child: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: SizedBox(
            height: 70,
            child: Column(
              children: [
                const Divider(
                    thickness: 1,
                    color: Color(0xffCBCBCB),
                    indent: 0,
                    endIndent: 0),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          tooltip: 'Tổng quan',
                          icon: const IconButtomItem(icon: Icons.widgets),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                        ),
                        IconButton(
                          tooltip: 'Quản lí dự án',
                          icon:
                              const IconButtomItem(icon: Icons.business_center),
                          onPressed: () {
                            Navigator.pushNamed(context, '/project');
                          },
                        ),
                        IconButton(
                          tooltip: 'Quản lí tài khoản',
                          icon:
                              const IconButtomItem(icon: Icons.manage_accounts),
                          onPressed: () {
                            Navigator.pushNamed(context, '/user-management');
                          },
                        ),
                        IconButton(
                          tooltip: 'Quản lí sản phẩm',
                          icon: const IconButtomItem(icon: Icons.photo_library),
                          onPressed: () {},
                        ),
                        IconButton(
                          tooltip: 'Quản lí danh mục',
                          icon: const IconButtomItem(icon: Icons.category),
                          onPressed: () {
                            Navigator.pushNamed(context, '/category');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconButtomItem extends StatelessWidget {
  const IconButtomItem({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 30, color: const Color(0xff262626));
    // return Icon(icon, size: 29, color: const Color(MyColors.blue_gradient_01));
  }
}
