import 'package:daisy_application/pages/common/style.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 200,
        child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 10),
                const Text('  Daisy', style: Style.stringBold),
                const SizedBox(height: 5),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.home, color: Colors.black),
                    label: const Text('Home',
                        style: TextStyle(color: Colors.black))),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.list, color: Colors.black),
                    label: const Text('Browse categories',
                        style: TextStyle(color: Colors.black))),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.lightbulb, color: Colors.black),
                    label: const Text('How it work',
                        style: TextStyle(color: Colors.black))),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.person_search, color: Colors.black),
                    label: const Text('Find a designer',
                        style: TextStyle(color: Colors.black))),
                const Divider(),
                const Divider(color: Colors.transparent),
                const Text('  Support', style: Style.stringBold),
                const SizedBox(height: 5),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.phone, color: Colors.black),
                    label: const Text('1900 8989',
                        style: TextStyle(color: Colors.black))),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.help, color: Colors.black),
                    label: const Text('Help center',
                        style: TextStyle(color: Colors.black))),
              ],
            )));
  }
}
