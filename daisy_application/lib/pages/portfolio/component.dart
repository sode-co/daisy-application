import 'package:daisy_application/pages/common/responsive.dart';
import 'package:flutter/material.dart';

class PortfolioBody extends StatefulWidget {
  const PortfolioBody({Key? key}) : super(key: key);

  @override
  State<PortfolioBody> createState() => _PortfolioBodyState();
}

class _PortfolioBodyState extends State<PortfolioBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        // background image and bottom contents
        SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: 200.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/portfolio/cover.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text('Content goes here'),
                  ),
                ),
              )
            ],
          ),
        ),
        // Profile image
        Positioned(
          top: 130.0,
          left: Responsive.isDesktop(context)
              ? 30.0
              : 10.0, // (background container size) - (circle height / 2)
          child: const SizedBox(
            height: 130.0,
            width: 130.0,
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage('assets/images/portfolio/avatar.png'),
            ),
          ),
        ),
        Positioned(
          top: 205.0,
          left: Responsive.isDesktop(context)
              ? 170.0
              : 10.0, // (background container size) - (circle height / 2)
          child: SizedBox(
            height: 100.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Merci Dsgn',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 2.0),
                Text(
                  'merci@gmail.com',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
