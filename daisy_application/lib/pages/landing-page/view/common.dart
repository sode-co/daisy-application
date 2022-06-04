import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:daisy_application/pages/common/colors.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/common/style.dart';
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

class TrendingTab extends StatelessWidget {
  const TrendingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Map<String, String>> trendingItems = [
      {'Branding design': 'assets/images/intro/trending/branding-design.png'},
      {
        'Logo & website':
            'assets/images/intro/trending/logo-website-squarespace.png'
      },
      {'Website builders': 'assets/images/intro/trending/web-builder.png'},
      {
        'Logo & brand identity pack':
            'assets/images/intro/trending/brand-identity-pack.png'
      },
      {
        'Product packaging':
            'assets/images/intro/trending/product-packaging-design.png'
      },
      {'T-shirt': 'assets/images/intro/trending/t-shirt-design.png'},
      {
        'Illustration or graphics':
            'assets/images/intro/trending/illustrations.png'
      },
      {'Book cover': 'assets/images/intro/trending/book-cover-design.png'},
      {'Show more': 'assets/images/intro/trending/categories.png'}
    ];
    var width = Responsive.isDesktop(context) ? 1920.0 : 450.0;
    var imgHeight = Responsive.isDesktop(context) ? 150 : 100;
    var paddingHorizontal = Responsive.isDesktop(context) ? 35.0 : 1.0;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Trending', style: Style.h6Bold),
          SizedBox(
            height: 200.0,
            width: width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: trendingItems
                  .map((item) =>
                      renderTrendingImageItem(size.width, item, imgHeight))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Padding renderTrendingImageItem(pageWidth, imageItem, imgHeight) {
    String title = '';
    String imgSrc = '';
    imageItem.forEach((k, v) => {title = k, imgSrc = v});
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
      child: SizedBox(
        height: imgHeight,
        child: Column(
          children: [
            InkWell(child: Image.asset(imgSrc, height: imgHeight)),
            Text(title),
          ],
        ),
      ),
    );
  }
}

class StatisticInfoSlider extends StatelessWidget {
  const StatisticInfoSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = Responsive.isDesktop(context) ? 400.0 : 300.0;
    var width = size.width;
    var fontSize = Responsive.isDesktop(context) ? 50.0 : 20.0;
    return SizedBox(
      height: height,
      width: width,
      child: CarouselSlider(
        options: CarouselOptions(height: 400.0, autoPlay: true),
        items: ['9,920,123 designs', '11,123 3D designs', '221,021 connections']
            .map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/intro/map.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$i',
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w900,
                        color: const Color(MyColors.blue_gradient_01)),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
