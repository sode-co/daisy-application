import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/common/size_mode.dart';
import 'package:daisy_application/pages/common/widget_utils.dart';
import 'package:daisy_application/pages/listeners/WidgetListener.dart';
import 'package:daisy_application/pages/widget/design.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Header extends StatefulWidget with PreferredSizeWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ApplicationState appState = context.watch();
    final isLoggedIn = appState.isLoggedIn;
    WidgetListener listener = context.read();
    return AppBar(
      title: (Responsive.isDesktop(context))
          ? Row(
              children: <Widget>[
                const SizedBox(width: 150),
                Image.asset('assets/images/weblogo.png', width: 100),
                ButtonInfo(
                    text: 'Danh mục',
                    onPressed: () {
                      Navigator.pushNamed(context, '/categories');
                    }),
                ButtonInfo(
                    text: 'Đăng tin',
                    onPressed: () {
                      Navigator.pushNamed(context, '/post-new-job');
                    }),
                ButtonInfo(
                  text: 'Tìm kiếm designer',
                  onPressed: () {},
                ),
                ButtonInfo(
                  text: 'Tìm việc freelance',
                  onPressed: () {
                    Navigator.pushNamed(context, '/find-freelance-job');
                  },
                ),
              ],
            )
          : Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Image.asset('assets/images/weblogo.png', width: 100)),
      actions: <Widget>[
        if (Responsive.isDesktop(context)) const SizedBox(width: 5),
        const SizedBox(width: 1),
        ..._createAuthenButton(isLoggedIn),
        if (Responsive.isDesktop(context)) SizedBox(width: size.width * 0.1),
      ],
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }

  List<Widget> _createAuthenButton(bool isLoggedIn) => isLoggedIn
      ? [
          ButtonInfo(
            text: 'Đăng xuất',
            heightMode: HeightMode.MATCH_PARENT,
            onPressed: () {},
          )
        ]
      : [
          _createSignupButton(),
          // if (Responsive.isDesktop(context)) const SizedBox(width: 10),
          const Center(child: Text('  ')),
          ButtonInfo(
            heightMode: HeightMode.MATCH_PARENT,
            text: 'Đăng nhập',
            onPressed: () {},
          )
        ];

  Widget _createSignupButton() => ButtonIcon.asset(
        'assets/images/google.png',
        text: context.isScreenType(ScreenType.DESKTOP)
            ? 'Đăng ký qua email Fpt'
            : 'Đăng ký',
        backgroundColor: Design.colorWhite,
        onPressed: () {},
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
