import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/router/router.gr.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;

    return BottomAppBar(
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
                        tooltip: 'Workspace',
                        icon: const IconButtomItem(icon: Icons.work_outline),
                        onPressed: () {
                          context.router.push(const WorkSpaceRoute());
                        },
                      ),
                      IconButton(
                        tooltip: 'Tìm kiếm jobs',
                        icon: const IconButtomItem(
                            icon: Icons.person_search_outlined),
                        onPressed: () {
                          context.pushRoute(DicoveryJobRoute(request: null));
                        },
                      ),
                      IconButton(
                        tooltip: 'Home',
                        icon: const IconButtomItem(icon: Icons.home),
                        onPressed: () {},
                      ),
                      IconButton(
                        tooltip: 'Tìm kiếm designers',
                        icon: const IconButtomItem(icon: Icons.query_stats),
                        onPressed: () {
                          context.pushRoute(const FindDesignerRoute());
                        },
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
