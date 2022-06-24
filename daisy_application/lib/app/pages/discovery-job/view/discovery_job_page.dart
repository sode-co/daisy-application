import 'package:daisy_application/app/pages/discovery-job/model/discovery_job_screen_state.dart';
import 'package:daisy_application/app/pages/discovery-job/view/component.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/grpc/request/request_grpc_client.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/listeners/WidgetListener.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoverJobPage extends StatefulWidget {
  const DiscoverJobPage({Key? key}) : super(key: key);

  @override
  State<DiscoverJobPage> createState() => _DiscoverJobState();
}

class _DiscoverJobState extends State<DiscoverJobPage> with WidgetListener {
  late DiscoveryJobScreenState _screenState;
  late WidgetListener _widgetListener;
  late RequestGrpcClient requestGrpcClient;
  @override
  initState() {
    _screenState = DiscoveryJobScreenState();
    _widgetListener = this;
    requestGrpcClient = locator.get();
    super.initState();

    onLoadMoreRequestEvent();
  }

  @override
  Future<void> onLoadMoreRequestEvent() async {
    final lastLoadedRequestTimeStamp = _screenState.requests.isNotEmpty
        ? _screenState.requests.last.createdAt!.microsecondsSinceEpoch
        : DateTime.now().millisecondsSinceEpoch;

    await for (var singleResult in requestGrpcClient
        .startStreamingRequests(lastLoadedRequestTimeStamp)) {
      if (singleResult.failureType == FAILURE_TYPE.NONE) {
        _screenState.addRequests(singleResult.data!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return _screenState;
          },
        ),
        Provider(create: (_) => _widgetListener),
      ],
      child: Scaffold(
        appBar: const Header(),
        body: const JobInfoColumn(),
        bottomNavigationBar:
            !Responsive.isDesktop(context) ? const BottomNavBar() : null,
      ),
    );
  }
}
