import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Header extends StatelessWidget with PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Center(child: Image.asset('/images/logo.png', width: 150), widthFactor: 100,),
        actions: <Widget>[
          TextButton(child: Text("Login", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)), onPressed: () {})
          ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
