import 'dart:async';

import 'package:daisy_application/pages/common/colors.dart';
import 'package:daisy_application/pages/landing-page/view/common.dart';
import 'package:flutter/material.dart';

class BodyLandingPageWeb extends StatefulWidget {
  const BodyLandingPageWeb({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyLandingWebState();
}

class _BodyLandingWebState extends State<BodyLandingPageWeb> {
  int colorIndex = 0;
  List<int> colors = [
    MyColors.white,
    MyColors.white,
    MyColors.white,
    MyColors.white,
    MyColors.white,
  ];
  List<String> images = [
    'assets/images/intro/clothes.png',
    'assets/images/intro/brand.png',
    'assets/images/intro/packaging.png',
    'assets/images/intro/logo.png',
    'assets/images/intro/packaging2.png',
  ];

  setColorIndex(value) {
    if (mounted) {
      setState(() => colorIndex = value);
    }
  }

  @override
  initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 10), (timer) {
      if (colorIndex == colors.length - 1) {
        setColorIndex(0);
      } else {
        colorIndex++;
        setColorIndex(colorIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                renderImageCarousel(),
                const SizedBox(width: 100),
                Column(
                  children: <Widget>[
                    introText(size.width, Color(colors[colorIndex])),
                    const SizedBox(height: 20),
                    SearchCategoriesTextField(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column renderImageCarousel() {
    return Column(children: <Widget>[
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: SizedBox(
            width: 650,
            height: 350,
            child: Image.asset(images[colorIndex], width: 450)),
      ),
      Row(children: [
        IconButton(
          icon: const Icon(Icons.circle,
              color: Color.fromARGB(255, 190, 188, 188), size: 10),
          onPressed: () {
            setColorIndex(0);
          },
        ),
        IconButton(
          icon: const Icon(Icons.circle,
              color: Color.fromARGB(255, 190, 188, 188), size: 10),
          onPressed: () {
            setColorIndex(1);
          },
        ),
        IconButton(
          icon: const Icon(Icons.circle,
              color: Color.fromARGB(255, 190, 188, 188), size: 10),
          onPressed: () {
            setColorIndex(2);
          },
        ),
        IconButton(
          icon: const Icon(Icons.circle,
              color: Color.fromARGB(255, 190, 188, 188), size: 10),
          onPressed: () {
            setColorIndex(3);
          },
        ),
        IconButton(
          icon: const Icon(Icons.circle,
              color: Color.fromARGB(255, 190, 188, 188), size: 10),
          onPressed: () {
            setColorIndex(4);
          },
        )
      ]),
    ]);
  }

  Column introText(pageWidth, color) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('World-class design',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: pageWidth * 0.035,
            )),
        Text('At your service',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: pageWidth * 0.035,
            )),
        Divider(
            thickness: 6,
            indent: pageWidth * 0.005,
            endIndent: pageWidth * 0.085,
            color: Color(colors[colorIndex])),
      ]);
}
