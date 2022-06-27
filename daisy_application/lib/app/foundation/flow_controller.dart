library flow_controller;

import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/flow_controllers/post_new_job/post_new_job_flow_controller.dart';
import 'package:daisy_application/app/pages/post-new-job/view/post_new_job.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class FlowController extends StatefulWidget {
  final Widget child;

  const FlowController(this.child, {Key? key}) : super(key: key);

  @override
  State<FlowController> createState() => FlowControllerState();
}

class FlowControllerState<T extends FlowController> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
