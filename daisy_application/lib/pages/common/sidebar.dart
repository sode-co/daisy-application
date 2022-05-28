import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/widgets/framework.dart';


class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[TextButton.icon(onPressed: () {}, icon: Icon(Icons.home), label: Text('Home'),)],
    ));
  }
}
