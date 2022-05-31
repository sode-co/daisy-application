import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:daisy_application/pages/common/color.dart';
import 'package:daisy_application/pages/common/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodyLandingPageMobile extends StatefulWidget {
  const BodyLandingPageMobile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyLandingMobileState();
}

class _BodyLandingMobileState extends State<BodyLandingPageMobile> {
  int colorIndex = 0;

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

  List<int> colors = [
    0xFF5022B8,
    0xFF1C1B1A,
    0xFF0493DD,
    0xFF1C1B1A,
    0xFF009697
  ];
  List<String> images = [
    'assets/images/intro/clothes.png',
    'assets/images/intro/brand.png',
    'assets/images/intro/packaging.png',
    'assets/images/intro/logo.png',
    'assets/images/intro/packaging2.png',
  ];

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

  setColorIndex(value) {
    if (mounted) {
      setState(() => colorIndex = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: size.width * 0.035),
                  child: introText(size.width, Color(colors[colorIndex]))),
              Divider(
                  thickness: 6,
                  indent: size.width * 0.05,
                  endIndent: size.width * 0.85,
                  color: Color(colors[colorIndex])),
              const SizedBox(height: 20),
              searchCategoriesTextField(
                  size.width * 0.89, Color(colors[colorIndex])),
              renderImageCarousel(),
              introDescription(size.width),
              const Text('Trending', style: Style.h6Bold),
              SizedBox(height: 200.0, child: trendingTab(size.width)),
              const Text('Boost your income', style: Style.h6Bold),
              renderIntroCarouselImages(),
              Padding(
                  padding: EdgeInsets.only(left: size.width * 0.2),
                  child: renderWelcomeToLogin()),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.01,
                      vertical: size.width * 0.05),
                  child: renderSeeAllCategories(size.width)),
              const SizedBox(height: 10),
            ],
          ),
        ),
        Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 220, 220, 220)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.width * 0.05, horizontal: size.width * 0.1),
            child: renderFooter(),
          ),
        ),
      ],
    );
  }

  Column renderSeeAllCategories(pageWidth) {
    return Column(
      children: [
        const Text('Logos, websites, book covers & more!', style: Style.h5Bold),
        Divider(
          height: 5,
          thickness: 4,
          indent: pageWidth * 0.004,
          endIndent: pageWidth * 0.75,
          color: Colors.black,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: pageWidth * 0.05, vertical: pageWidth * 0.05),
          child: const Text(
              'Get the perfect logo design - or any design in over 90 categories! Whatever your business need or budget, we’ll help get it done.'),
        ),
        Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black,
            border: Border.all(color: Colors.black, style: BorderStyle.solid),
          ),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'See all categories',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  CarouselSlider renderIntroCarouselImages() {
    return CarouselSlider(
      options: CarouselOptions(height: 400.0, autoPlay: true),
      items:
          ['9,920,123 designs', '11,123 3D designs', '221,021 connections'].map(
        (i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/intro/mobile_map.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Text(
                    '$i',
                    style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: MyColor.orange),
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }

  Column renderWelcomeToLogin() {
    return Column(
      children: [
        Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MyColor.orange,
              border:
                  Border.all(color: MyColor.orange, style: BorderStyle.solid)),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Find your talent',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              border:
                  Border.all(color: MyColor.orange, style: BorderStyle.solid)),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Designer, join now',
              style: TextStyle(
                  color: MyColor.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  Column renderFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        renderCopyright(),
        Padding(
          padding: const EdgeInsets.only(left: 60),
          child: renderSocialMediaButton(),
        ),
      ],
    );
  }

  Row renderSocialMediaButton() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.facebook, size: 20),
        ),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.instagram, size: 20),
        ),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.linkedin, size: 20),
        ),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.twitter, size: 20),
        ),
      ],
    );
  }

  Row renderCopyright() {
    return Row(children: const [
      Text('© Daisy'),
      Text(' | '),
      Text('by Sode'),
      Text(' | '),
      Text('Term'),
      Text(' | '),
      Text('Privacy'),
      Text('  '),
      Icon(Icons.public),
      Text('English'),
    ]);
  }

  SizedBox renderTrendingImageItem(pageWidth, imageItem) {
    String title = '';
    String imgSrc = '';
    imageItem.forEach((k, v) => {title = k, imgSrc = v});
    return SizedBox(
      width: pageWidth * 0.3,
      child: Column(
        children: [Image.asset(imgSrc, height: 150), Text(title)],
      ),
    );
  }

  ListView trendingTab(pageWidth) {
    return ListView(
      padding: const EdgeInsets.all(8),
      scrollDirection: Axis.horizontal,
      children: trendingItems
          .map((item) => renderTrendingImageItem(pageWidth, item))
          .toList(),
    );
  }

  Padding introDescription(pageWidth) {
    return Padding(
        padding: EdgeInsets.all(pageWidth * 0.03),
        child: const Text(
            'Daisy is the go-to graphic design service by my Group. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.'));
  }

  Column renderImageCarousel() {
    return Column(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: SizedBox(
              width: 500,
              height: 400,
              child: Image.asset(images[colorIndex], width: 450)),
        ),
        Row(
          children: [
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
          ],
        ),
      ],
    );
  }

  Column searchCategoriesTextField(width, color) {
    return Column(
      children: [
        SizedBox(
          width: width,
          child: const TextField(
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
          child: TextButton(
            onPressed: () {},
            style:
                ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
            child: const Center(
                child: Text('Get started', style: Style.whiteStringBold)),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: width * 0.3),
            Icon(Icons.play_circle,
                color:
                    color), // sometimes it causes bug not in dom tree??? sometimes not
            const SizedBox(width: 7),
            Text('See creativity at work',
                style: TextStyle(color: color, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }

  Column introText(pageWidth, color) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'World-class design',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: pageWidth * 0.1,
            ),
          ),
          Text(
            'At your service',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: pageWidth * 0.1,
            ),
          ),
        ],
      );
}
