import 'dart:async';

import 'package:flutter/material.dart';

class BodyLandingPageMobile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyLandingMobileState();
}

class _BodyLandingMobileState extends State<BodyLandingPageMobile> {
  int colorIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<int> colors = [0xFF5022B8, 0xFF0493DD, 0xFF1C1B1A, 0xFF009697];
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (colorIndex == colors.length - 1) {
        setState(() => {colorIndex = 0});
      } else {
        setState(() => {colorIndex++});
      }
    });

    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            introText(colors[colorIndex]),
            Divider(
                thickness: 6,
                indent: 0,
                endIndent: size.width * 0.85,
                color: Color(colors[colorIndex])),
          ],
    ));
  }

  Column introText(color) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('World-class design',
            style: TextStyle(
                color: Color(color),
                fontWeight: FontWeight.w900,
                fontSize: 50,
            )),
        Text('At your service',
            style: TextStyle(
                color: Color(color),
                fontWeight: FontWeight.w900,
                fontSize: 50,
            )),
      ]);
}
