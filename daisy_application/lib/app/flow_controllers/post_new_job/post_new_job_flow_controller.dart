import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/design/design_snackbar.dart';
import 'package:daisy_application/app/pages/post-new-job/deps/post_new_job_deps.dart';
import 'package:daisy_application/app/pages/post-new-job/model/post_new_job_state.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/http/request/request_rest_api.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostNewJobFlowController extends AutoRouter {
  const PostNewJobFlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => _PostNewJobFlowControllerState();
}

class _PostNewJobFlowControllerState extends AutoRouterState
    implements PostNewJobListener<AutoRouter> {
  PostNewJobState? jobState;
  @override
  void initState() {
    jobState = PostNewJobState();
    super.initState();
  }

  @override
  void dispose() {
    jobState = null;
    super.dispose();
  }

  @override
  void onBtnJobPostClicked() => _postNewJob();

  Future<void> _postNewJob() async {
    RequestRestApi _requestClient = locator.get();
    await _requestClient.createNewRequest(jobState!.parentRequest);
    context.toastSuccess('Đăng tin tuyển dụng thành công');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: ((context) => jobState!))],
      child: super.build(context),
    );
  }
}
