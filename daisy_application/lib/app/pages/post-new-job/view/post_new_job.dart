import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/listeners/WidgetListener.dart';
import 'package:daisy_application/app/pages/post-new-job/model/post_new_job_state.dart';
import 'package:daisy_application/app/signup-page/model/sign_up_page_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';

class PostNewJob extends StatefulWidget {
  const PostNewJob({Key? key}) : super(key: key);

  @override
  State<PostNewJob> createState() => _PostNewJobState();
}

class _PostNewJobState extends State<PostNewJob> with WidgetListener {
  late SignUpPageState _signUpPageState;
  late PostNewJobState _postNewJobState;
  late WidgetListener _widgetListener;

  @override
  initState() {
    _signUpPageState = SignUpPageState();
    _postNewJobState = PostNewJobState();
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
        ChangeNotifierProvider(
          create: (_) {
            return _postNewJobState;
          },
        ),
        Provider(create: (_) => _widgetListener),
      ],
      child: Scaffold(
        appBar: const Header(),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: const PostNewJobForm(),
          ),
        ),
        bottomNavigationBar:
            !Responsive.isDesktop(context) ? const BottomNavBar() : null,
      ),
    );
  }
}
