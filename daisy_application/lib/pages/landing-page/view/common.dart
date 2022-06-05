import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:daisy_application/pages/common/colors.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/common/style.dart';
import 'package:daisy_application/pages/landing-page/listener/LandingPageListener.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SearchCategoriesTextField extends StatelessWidget {
  const SearchCategoriesTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listener = context.read<LandingPageListener>();

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
            onPressed: () {
              listener.submitTextfieldForSelectingCategories();
            },
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

class WelcomeToLogin extends StatelessWidget {
  const WelcomeToLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isDesktop = Responsive.isDesktop(context);
    return Column(
      children: [
        findYourTalentBtn(isDesktop),
        const SizedBox(height: 10),
        designerJoinNowBtn(isDesktop),
      ],
    );
  }

  Container designerJoinNowBtn(isDesktop) {
    return Container(
      height: 50,
      width: isDesktop ? 500 : 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(
              color: const Color(MyColors.blue_gradient_01),
              style: BorderStyle.solid)),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Designer, join now',
          style: TextStyle(
              color: Color(MyColors.blue_gradient_01),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }

  Container findYourTalentBtn(isDesktop) {
    return Container(
      height: 55,
      width: isDesktop ? 500 : 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(MyColors.blue_gradient_01),
          border: Border.all(
              color: const Color(MyColors.blue_gradient_01),
              style: BorderStyle.solid)),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Find your talent',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Divider(
            color: Color(MyColors.dark_blue),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FooterComponent.renderResourceFooter(),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.41),
                    FooterComponent.renderCopyright(),
                    Padding(
                        padding: EdgeInsets.only(left: size.width * 0.05),
                        child: FooterComponent.renderSocialMediaButton()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterComponent {
  static Row renderSocialMediaButton() {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.facebook, size: 20)),
        IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.instagram, size: 20)),
        IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.linkedin, size: 20)),
        IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.twitter, size: 20)),
      ],
    );
  }

  static Row renderCopyright() {
    return Row(
      children: const [
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
      ],
    );
  }

  static Row renderResourceFooter() {
    return Row(children: [
      SizedBox(
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/weblogo.png', width: 300),
            Row(
              children: [
                Image.asset('assets/images/appstore.png', scale: 3),
                Image.asset('assets/images/chplay.png', scale: 4),
              ],
            ),
            const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vehicula efficitur nibh non commodo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In nibh neque, commodo eget dui ac, hendrerit commodo risus. In lobortis rutrum velit, eget efficitur nibh laoreet vitae. Duis vel elit mollis nulla tincidunt auctor at in justo. Sed viverra diam arcu, eu elementum quam porttitor commodo.'),
          ],
        ),
      ),
      const SizedBox(
        width: 120,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Company', style: Style.stringBold),
          Text('About'),
          Text('Contact'),
          Text('Careers'),
          Text('Team'),
          Text('Press releases'),
          Text('In the media'),
          Text('Testimonials'),
        ],
      ),
      const SizedBox(
        width: 120,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Design services', style: Style.stringBold),
          Text('Find a designer'),
          Text('Discover inspiration'),
          Text('Pricing'),
          Text('Agencies'),
          Text('Designer resources'),
          Text('Featured partners'),
          Text('Help'),
        ],
      ),
      const SizedBox(
        width: 120,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Get a design', style: Style.stringBold),
          Text('Logo design'),
          Text('Business card'),
          Text('Web page design'),
          Text('Brand guide'),
          Text('Packaging design'),
          Text('T-shirt design'),
          Text('Book cover design'),
        ],
      ),
    ]);
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(MyColors.primaryColor),
        border: Border.all(
          color: const Color(MyColors.white),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: TextButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, '/signup');
        },
        label: const Text('Sign Up',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900)),
        icon: const Icon(Icons.login, color: Colors.white),
      ),
    );
  }
}
