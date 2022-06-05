import 'package:daisy_application/pages/common/bottomnavbar.dart';
import 'package:daisy_application/pages/common/header.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/signup-page/controller/sign_up_page_controller.dart';
import 'package:daisy_application/pages/signup-page/listener/sign_up_page_listener.dart';
import 'package:daisy_application/pages/signup-page/model/sign_up_page_state.dart';
import 'package:daisy_application/pages/signup-page/view/mobile.dart';
import 'package:daisy_application/pages/signup-page/view/web.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late SignUpPageState _signUpPageState;
  late SignUpPageListener _signUpPageListener;
  @override
  initState() {
    _signUpPageState = SignUpPageState();
    _signUpPageListener = SignUpPageController(_signUpPageState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return _signUpPageState;
          },
        ),
        Provider(create: (_) => _signUpPageListener),
      ],
      child: Scaffold(
        appBar: const Header(),
        body: Responsive.isDesktop(context)
            ? const SingleChildScrollView(child: BodySignUpWeb())
            : const SingleChildScrollView(child: BodySignUpMobile()),
        bottomNavigationBar:
            !Responsive.isDesktop(context) ? const BottomNavBar() : null,
      ),
    );
  }
}
