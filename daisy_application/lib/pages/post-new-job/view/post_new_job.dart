import 'package:daisy_application/pages/common/bottomnavbar.dart';
import 'package:daisy_application/pages/common/header.dart';
import 'package:daisy_application/pages/common/responsive.dart';
import 'package:daisy_application/pages/post-new-job/controller/post_new_job_controller.dart';
import 'package:daisy_application/pages/post-new-job/listener/post_new_job_listener.dart';
import 'package:daisy_application/pages/post-new-job/model/post_new_job_state.dart';
import 'package:daisy_application/pages/post-new-job/view/mobile.dart';
import 'package:daisy_application/pages/post-new-job/view/web.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostNewJob extends StatefulWidget {
  const PostNewJob({Key? key}) : super(key: key);

  @override
  State<PostNewJob> createState() => _PostNewJobState();
}

class _PostNewJobState extends State<PostNewJob> {
  late PostNewJobState _postNewJobState;
  late PostNewJobListener _postNewJobListener;
  @override
  initState() {
    _postNewJobState = PostNewJobState();
    _postNewJobListener = PostNewJobController(_postNewJobState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return _postNewJobState;
          },
        ),
        Provider(create: (_) => _postNewJobListener),
      ],
      child: Scaffold(
        appBar: const Header(),
        body: Responsive.isDesktop(context)
            ? const SingleChildScrollView(child: BodyPostNewJobWeb())
            : const SingleChildScrollView(child: BodyPostNewJobMobile()),
        bottomNavigationBar:
            !Responsive.isDesktop(context) ? const BottomNavBar() : null,
      ),
    );
  }
}
