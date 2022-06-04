import 'dart:async';

import 'package:daisy_application/pages/common/colors.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchCategoriesTextField extends StatelessWidget {
  const SearchCategoriesTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width =
        Responsive.isDesktop(context) ? size.width * 0.3 : size.width * 0.94;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        width: width,
        child: TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white,
                  width: Responsive.isDesktop(context) ? 0.0 : 1.0),
            ),
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            labelText: 'Logo, website, branding...',
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      SizedBox(
          height: 50,
          width: width,
          child: TextButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            child: const Center(
              child: Text(
                'Get started',
                style: TextStyle(
                    color: Color(MyColors.blue_gradient_01),
                    fontWeight: FontWeight.w900),
              ),
            ),
          )),
      const SizedBox(
        height: 10,
      ),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Icon(Icons.play_circle,
            color: Colors
                .white), // sometimes it causes bug not in dom tree??? sometimes not
        SizedBox(width: 7),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: Text(
            'See creativity at work',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ]),
    ]);
  }
}

class IntroCarouselImage extends StatefulWidget {
  const IntroCarouselImage({Key? key}) : super(key: key);

  @override
  State<IntroCarouselImage> createState() => _IntroCarouselImageState();
}

class _IntroCarouselImageState extends State<IntroCarouselImage> {
  int imgIndex = 0;
  List<String> images = [
    'assets/images/intro/clothes.png',
    'assets/images/intro/brand.png',
    'assets/images/intro/packaging.png',
    'assets/images/intro/logo.png',
    'assets/images/intro/packaging2.png',
  ];

  setImgIndex(value) {
    if (mounted) {
      setState(() => imgIndex = value);
    }
  }

  @override
  initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 10), (timer) {
      if (imgIndex == images.length - 1) {
        setImgIndex(0);
      } else {
        imgIndex++;
        setImgIndex(imgIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 1000),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: SizedBox(
            width: 650,
            height: 350,
            child: Image.asset(images[imgIndex], width: 450)),
      ),
      Row(children: [
        IconButton(
          icon: const Icon(Icons.circle,
              color: Color.fromARGB(255, 190, 188, 188), size: 10),
          onPressed: () {
            setImgIndex(0);
          },
        ),
        IconButton(
          icon: const Icon(Icons.circle,
              color: Color.fromARGB(255, 190, 188, 188), size: 10),
          onPressed: () {
            setImgIndex(1);
          },
        ),
        IconButton(
          icon: const Icon(Icons.circle,
              color: Color.fromARGB(255, 190, 188, 188), size: 10),
          onPressed: () {
            setImgIndex(2);
          },
        ),
        IconButton(
          icon: const Icon(Icons.circle,
              color: Color.fromARGB(255, 190, 188, 188), size: 10),
          onPressed: () {
            setImgIndex(3);
          },
        ),
        IconButton(
          icon: const Icon(Icons.circle,
              color: Color.fromARGB(255, 190, 188, 188), size: 10),
          onPressed: () {
            setImgIndex(4);
          },
        )
      ]),
    ]);
  }
}

class IntroText extends StatelessWidget {
  const IntroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var pageWidth = size.width;
    var fontSize =
        Responsive.isDesktop(context) ? pageWidth * 0.035 : pageWidth * 0.1;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('World-class design',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: fontSize,
            )),
        Text('At your service',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: fontSize,
            )),
      ],
    );
  }
}
