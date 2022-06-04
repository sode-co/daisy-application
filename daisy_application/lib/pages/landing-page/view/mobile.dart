import 'package:daisy_application/pages/common/colors.dart';
import 'package:daisy_application/pages/landing-page/view/common.dart';
import 'package:flutter/material.dart';

class BodyLandingPageMobile extends StatefulWidget {
  const BodyLandingPageMobile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyLandingMobileState();
}

class _BodyLandingMobileState extends State<BodyLandingPageMobile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/mobilebg.png'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: size.width * 0.035),
                child: introText(size.width, Colors.white)),
            Divider(
                thickness: 6,
                indent: size.width * 0.05,
                endIndent: size.width * 0.85,
                color: Colors.white),
            const SizedBox(height: 20),
            const SearchCategoriesTextField(),
            // searchCategoriesTextField(
            //     size.width * 0.89, Color(colors[colorIndex])),
            const IntroCarouselImage()
          ],
        ),
      ),
    );
  }

  Column searchCategoriesTextField(width, color) {
    return Column(children: [
      SizedBox(
        width: width,
        child: const TextField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
            ),
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search, color: Colors.white),
            labelText: 'Logo, website, branding...',
            labelStyle: TextStyle(color: Colors.white),
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
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(width: width * 0.3),
        Icon(Icons.play_circle,
            color:
                color), // sometimes it causes bug not in dom tree??? sometimes not
        const SizedBox(width: 7),
        Text('See creativity at work',
            style: TextStyle(color: color, fontWeight: FontWeight.w600)),
      ]),
    ]);
  }

  Column introText(pageWidth, color) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('World-class design',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: pageWidth * 0.1,
            )),
        Text('At your service',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
              fontSize: pageWidth * 0.1,
            )),
      ]);
}
