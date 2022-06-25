import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/flow_controllers/post_new_job/post_new_job_flow_controller.dart';
import 'package:daisy_application/app/listeners/WidgetListener.dart';
import 'package:daisy_application/app/pages/post-new-job/deps/post_new_job_deps.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'components.dart';

class PostNewJob extends StatefulWidget {
  const PostNewJob({Key? key}) : super(key: key);
  @override
  State<PostNewJob> createState() => _PostNewJobState();
}

class _PostNewJobState extends State<PostNewJob> with WidgetListener {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: PostNewJobForm(
            onSubmitted: listener.onBtnJobPostClicked,
          ),
        ),
      ),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const BottomNavBar() : null,
    );
  }

  PostNewJobListener get listener => context.findAncestorStateOfType()!;
}
