import 'package:daisy_application/pages/post-new-job/view/common.dart';
import 'package:flutter/material.dart';

class BodyPostNewJobWeb extends StatefulWidget {
  const BodyPostNewJobWeb({Key? key}) : super(key: key);

  @override
  State<BodyPostNewJobWeb> createState() => _BodyPostNewJobWebState();
}

class _BodyPostNewJobWebState extends State<BodyPostNewJobWeb> {
  @override
  Widget build(BuildContext context) {
    return const CreateJobForm();
  }
}
