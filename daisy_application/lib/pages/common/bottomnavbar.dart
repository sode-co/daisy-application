import 'package:daisy_application/pages/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(MyColors.secondaryColor),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              tooltip: 'Home',
              icon: const IconButtomItem(icon: Icons.home),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Find your talent',
              icon: const IconButtomItem(icon: Icons.person_search),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const IconButtomItem(icon: Icons.favorite),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Notifications',
              icon: const IconButtomItem(icon: Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Menu',
              icon: const IconButtomItem(icon: Icons.menu),
              onPressed: () {},
            ),
          ],
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
    return Icon(icon, size: 26);
  }
}
