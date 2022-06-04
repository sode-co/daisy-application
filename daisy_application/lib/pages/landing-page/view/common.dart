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
