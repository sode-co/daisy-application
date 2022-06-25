import 'dart:async';

import 'package:daisy_application/app/foundation/flow_controller.dart';
import 'package:daisy_application/app/pages/post-new-job/deps/post_new_job_deps.dart';
import 'package:daisy_application/app/pages/post-new-job/model/post_new_job_state.dart';
import 'package:daisy_application/app/pages/post-new-job/view/post_new_job.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/http/request/request_rest_api.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostNewJobFlowController extends StatefulWidget {
  static const RouteName = '#/post-new-job';
  static final routeHandler =
      Handler(handlerFunc: (c, p) => const PostNewJobFlowController());
  const PostNewJobFlowController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PostNewJobFlowControllerState();
}

class _PostNewJobFlowControllerState
    extends FlowControllerState<PostNewJobFlowController>
    implements PostNewJobListener<PostNewJobFlowController> {
  PostNewJobState? jobState;
  @override
  AppPage createInitialPage() => AppPage('', const PostNewJob());

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
  List<ChangeNotifierProvider> createInitialProviders() => [
        ChangeNotifierProvider<PostNewJobState>(
            create: ((context) => jobState!))
      ];

  @override
  void onBtnJobPostClicked() => _postNewJob();

  Future<void> _postNewJob() async {
    RequestRestApi _requestClient = locator.get();
    Debug.log
        .log('post-create-new-job', jobState!.parentRequest..description = '');
    await _requestClient.createNewRequest(jobState!.parentRequest);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Bài đăng của bạn đã được ghi nhận!'),
        backgroundColor: Colors.green.withOpacity(0.8),
      ),
    );
    // Timer(
    //   const Duration(seconds: 1),
    //   () {
    //     Navigator.pushNamed(context, '/find-freelance-job');
    //   },
    // );
  }

  static const String _POST_NEW_JOB_PAGE = '';

  @override
  FluroRouter createInitialRoute() => FluroRouter()
    ..define(_POST_NEW_JOB_PAGE,
        handler: Handler(handlerFunc: (ctx, param) => const PostNewJob()));
}
