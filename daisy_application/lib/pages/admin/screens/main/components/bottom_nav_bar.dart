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
                          tooltip: 'Menu',
                          icon: const IconButtomItem(icon: Icons.menu_outlined),
                          onPressed: context.read<MenuController>().controlMenu,
                        ),
                        IconButton(
                          tooltip: 'Find your talent',
                          icon: const IconButtomItem(
                              icon: Icons.person_search_outlined),
                          onPressed: () {
                            Navigator.pushNamed(context, '/categories');
                          },
                        ),
                        IconButton(
                          tooltip: 'Home',
                          icon: const IconButtomItem(icon: Icons.home),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                        ),
                        IconButton(
                          tooltip: 'Favorite',
                          icon:
                              const IconButtomItem(icon: Icons.favorite_border),
                          onPressed: () {},
                        ),
                        IconButton(
                          tooltip: 'Notifications',
                          icon: const IconButtomItem(
                              icon: Icons.notifications_outlined),
                          onPressed: () {},
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
