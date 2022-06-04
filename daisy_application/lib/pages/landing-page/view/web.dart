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
                  children: const <Widget>[
                    IntroText(),
                    SizedBox(height: 20),
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
}
