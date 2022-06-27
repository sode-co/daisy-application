import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/pages/discovery-job/deps/discovery_job_page_deps.dart';
import 'package:daisy_application/app/pages/discovery-job/model/discovery_job_screen_state.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/grpc/request/request_grpc_client.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DicoveryJobFlowController extends AutoRouter {
  const DicoveryJobFlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => _DiscoveryJobFlowControllerState();
}

class _DiscoveryJobFlowControllerState extends AutoRouterState
    implements DiscoveryJobListener<AutoRouter> {
  late RequestGrpcClient _requestGrpcClient;
  DiscoveryJobScreenState? _jobScreenState;

  @override
  void initState() {
    super.initState();
    _jobScreenState = DiscoveryJobScreenState();
    _requestGrpcClient = locator.get();
  }

  @override
  void dispose() {
    super.dispose();
    _jobScreenState = null;
  }

  @override
  void onLoadMoreRequest() => _loadMoreRequest();

  Future<void> _loadMoreRequest() async {
    if (_jobScreenState != null && _jobScreenState!.isRequestLoading) return;

    _jobScreenState?.isRequestLoading = true;
    const ns = 'load-more-request';
    Debug.log(ns, 'Start streaming request');
    try {
      final lastLoadedRequestTimeStamp = _jobScreenState!.requests.isNotEmpty
          ? _jobScreenState!.requests.last.createdAt!.millisecondsSinceEpoch
          : DateTime.now().millisecondsSinceEpoch;

      await for (var singleResult in _requestGrpcClient.startStreamingRequests(
          timeOffset: lastLoadedRequestTimeStamp)) {
        if (singleResult.failureType == FAILURE_TYPE.NONE) {
          Debug.log(ns, 'Drawing ${singleResult.data!.length} requests model');
          _jobScreenState?.addRequests(singleResult.data!);
        }
      }
    } on Exception catch (error) {
      Debug.log('Error while streaming request', error);
    }

    _jobScreenState?.isRequestLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => _jobScreenState)],
      child: super.build(context),
    );
  }
}
