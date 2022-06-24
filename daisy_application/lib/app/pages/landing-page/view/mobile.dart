import 'package:daisy_application/app/pages/landing-page/view/common.dart';
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
    return Column(
      children: [
        Introduction(size: size),
        const TrendingTab(),
        const StatisticInfoSlider(),
        const WelcomeToLogin(),
      ],
    );
  }
}

class Introduction extends StatelessWidget {
  const Introduction({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
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
                child: const IntroText()),
            Divider(
                thickness: 6,
                indent: size.width * 0.05,
                endIndent: size.width * 0.85,
                color: Colors.white),
            const SizedBox(height: 20),
            const SearchCategoriesTextField(),
            const IntroCarouselImage()
          ],
        ),
      ),
    );
  }
}
