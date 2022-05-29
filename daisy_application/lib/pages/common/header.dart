import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/common/style.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: (Responsive.isDesktop(context)) ?
                Row(children: <Widget>[
                    const SizedBox(width: 15),
                    Image.asset('/images/logo.png', width: 150),
                    TextButton(child: const Text('Categories', style: Style.stringBold), onPressed: () {}),
                    TextButton(child: const Text('How it works', style: Style.stringBold), onPressed: () {}),
                    TextButton(child: const Text('Find a designer', style: Style.stringBold), onPressed: () {}),
                  ]) :
                Center(child: Image.asset('/images/logo.png', width: 150)),
        actions: <Widget>[
          if(Responsive.isDesktop(context))
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.phone, color: Colors.black),
            label: const Text('1900 8989', style: Style.stringBold)
          ),
          if(Responsive.isDesktop(context))
          const SizedBox(width: 5),
          InkWell(
            onTap: () {},
            child: Ink(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                  border: Border.all(
                  color: Color.fromARGB(255, 188, 188, 188),
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Image.asset('/images/google.png', width: 20),
                    const SizedBox(width: 5),
                    if(Responsive.isDesktop(context))
                    const Text('Login in with FPT mail', style: Style.stringBold),
                    if(!Responsive.isDesktop(context))
                    const Text('Login', style: Style.stringBold),
                  ],
                ),
              ),
            ),
          ),
          if(Responsive.isDesktop(context))
          const SizedBox(width: 15),
          ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
