import 'package:daisy_application/pages/common/bottomnavbar.dart';
import 'package:daisy_application/pages/common/header.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/listeners/WidgetListener.dart';
import 'package:daisy_application/pages/signup-page/model/sign_up_page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoverJob extends StatefulWidget {
  const DiscoverJob({Key? key}) : super(key: key);

  @override
  State<DiscoverJob> createState() => _DiscoverJobState();
}

class _DiscoverJobState extends State<DiscoverJob> with WidgetListener {
  late SignUpPageState _signUpPageState;
  late WidgetListener _widgetListener;

  @override
  initState() {
    _signUpPageState = SignUpPageState();
    _widgetListener = this;
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
        Provider(create: (_) => _widgetListener),
      ],
      child: Scaffold(
        appBar: const Header(),
        body: const Text('PostNewJob'),
        bottomNavigationBar:
            !Responsive.isDesktop(context) ? const BottomNavBar() : null,
      ),
    );
  }
}
