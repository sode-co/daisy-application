import 'package:daisy_application/pages/landing-page/view/common.dart';
import 'package:flutter/material.dart';

class BodyLandingPageWeb extends StatefulWidget {
  const BodyLandingPageWeb({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyLandingWebState();
}

class _BodyLandingWebState extends State<BodyLandingPageWeb> {
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
                const IntroCarouselImage(),
                const SizedBox(width: 100),
                Column(
                  children: <Widget>[
                    introText(size.width, Colors.white),
                    const SizedBox(height: 20),
                    const SearchCategoriesTextField(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column introText(pageWidth, color) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            color: Colors.white,
          ),
        ],
      );
}
