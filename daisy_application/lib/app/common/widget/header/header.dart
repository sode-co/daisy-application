import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/utils/size_mode.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';
import 'package:daisy_application/app/common/widget/dropdown_avatar/dropdown_avatar.dart';
import 'package:daisy_application/app/common/widget/header/header_deps.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/constants.dart';
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
    // UserModel currentUser = appState.currentUser;

    return AppBar(
      title: (Responsive.isDesktop(context))
          ? Row(
              children: <Widget>[
                const SizedBox(width: 150),
                Image.asset('assets/images/weblogo.png', width: 100),
                ButtonInfo.small(text: 'Danh mục', onPressed: () {}),
                ButtonInfo.small(
                    text: 'Đăng tin',
                    onPressed: _navigationListener.onBtnJobPostClicked),
                if (isLoggedIn)
                  ButtonInfo.small(
                    text: 'Workspace',
                    onPressed: _navigationListener
                        .onBtnWorkspaceAndFindDesignerClicked,
                  ),
                ButtonInfo.small(
                  text: 'Tìm việc freelance',
                  onPressed: _navigationListener.onBtnFindJobCliked,
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
          const AvatarDropdownMenu(),
          ButtonInfo(
            text: 'Đăng xuất',
            heightMode: HeightMode.MATCH_PARENT,
            onPressed: _authenticationListener.onBtnSignoutClicked,
          )
        ]
      : [
          _createSignupButton(),
          // if (Responsive.isDesktop(context)) const SizedBox(width: 10),
          const Center(child: Text('  ')),
          ButtonInfo(
            heightMode: HeightMode.MATCH_PARENT,
            text: 'Đăng nhập',
            onPressed: _authenticationListener.onBtnSigninClicked,
          )
        ];

  Widget _createSignupButton() => ButtonIcon.asset(
        'assets/images/google.png',
        text: context.isScreenType(ScreenType.DESKTOP)
            ? 'Đăng ký qua email Fpt'
            : 'Đăng ký',
        backgroundColor: Design.colorWhite,
        onPressed: _authenticationListener.onBtnSignupClicked,
      );

  HeaderAuthenticationListener get _authenticationListener =>
      context.findAncestorStateOfType()!;
  HeaderNavigationListener get _navigationListener =>
      context.findAncestorStateOfType()!;
}
