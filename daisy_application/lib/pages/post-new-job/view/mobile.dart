import 'package:daisy_application/pages/post-new-job/view/common.dart';
import 'package:flutter/material.dart';

class BodyPostNewJobMobile extends StatefulWidget {
  const BodyPostNewJobMobile({Key? key}) : super(key: key);

  @override
  State<BodyPostNewJobMobile> createState() => _BodyPostNewJobMobileState();
}

class _BodyPostNewJobMobileState extends State<BodyPostNewJobMobile> {
  @override
  Widget build(BuildContext context) {
    return const CreateJobForm();
  }
}
