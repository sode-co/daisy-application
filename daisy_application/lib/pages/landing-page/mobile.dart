import 'dart:async';

import 'package:daisy_application/pages/common/style.dart';
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
    Timer.periodic(const Duration(seconds: 15), (timer) {
      if (colorIndex == colors.length - 1) {
        setState(() => {colorIndex = 0});
      } else {
        setState(() => {colorIndex++});
      }
    });

    return Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.035),
              child: introText(Color(colors[colorIndex]))
            ),
            Divider(
                thickness: 6,
                indent: size.width * 0.05,
                endIndent: size.width * 0.85,
                color: Color(colors[colorIndex])),
            const SizedBox(height: 20),
            searchCategoriesTextField(size.width * 0.89, Color(colors[colorIndex])),
          ],
        ));
  }

  Column searchCategoriesTextField(width, color) {
    return Column(children: [
      SizedBox(
        width: width,
        child: const TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
            labelText: 'Logo, website, branding...',
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
      height: 50,
      width: width,
      child:
            TextButton(
                onPressed: () {  },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
                child: const Center(child: Text('Get started', style: Style.whiteStringBold)),
      )),
      const SizedBox(
        height: 10,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        SizedBox(width: width * 0.3),
        Icon(Icons.play_circle, color: color), // sometimes it causes bug not in dom tree??? sometimes not
        const SizedBox(width: 7),
        Text('See creativity at work', style: TextStyle(color: color, fontWeight: FontWeight.w600)),
      ]),
    ]);
  }

  Column introText(color) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('World-class design',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: 50,
            )),
        Text('At your service',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: 50,
            )),
      ]);
}
