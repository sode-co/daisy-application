import 'package:daisy_application/app/foundation/flow_controller.dart';
import 'package:daisy_application/app/pages/discovery-job/deps/discovery_job_page_deps.dart';
import 'package:daisy_application/app/pages/discovery-job/model/discovery_job_screen_state.dart';
import 'package:daisy_application/app/pages/discovery-job/view/discovery_job_page.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/grpc/request/request_grpc_client.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:fluro/src/fluro_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DicoveryJobFlowController extends StatefulWidget {
  const DicoveryJobFlowController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DiscoveryJobFlowControllerState();
}

class _DiscoveryJobFlowControllerState
    extends FlowControllerState<DicoveryJobFlowController>
    implements DiscoveryJobListener<DicoveryJobFlowController> {
  late RequestGrpcClient _requestGrpcClient;
  DiscoveryJobScreenState? _jobScreenState;
  @override
  AppPage createInitialPage() =>
      AppPage('dicoveryPage', const DiscoverJobPage());

  @override
  List<ChangeNotifierProvider> createInitialProviders() => [
        ChangeNotifierProvider<DiscoveryJobScreenState>(
            create: (ctx) => _jobScreenState!)
      ];

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

    _jobScreenState?.isRequestLoading = false;
  }

  @override
  FluroRouter createInitialRoute() {
    // TODO: implement createInitialRoute
    throw UnimplementedError();
  }
}
