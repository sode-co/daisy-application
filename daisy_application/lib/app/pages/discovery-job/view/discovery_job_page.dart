import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/pages/discovery-job/deps/discovery_job_page_deps.dart';
import 'package:daisy_application/app/pages/discovery-job/model/discovery_job_screen_state.dart';
import 'package:daisy_application/app/pages/discovery-job/view/component.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/design/design.dart';
import 'stateless_component.dart';

class DiscoverJobPage extends StatefulWidget {
  static const name = 'find-job';

  const DiscoverJobPage({Key? key}) : super(key: key);

  @override
  State<DiscoverJobPage> createState() => _DiscoverJobState();
}

class _DiscoverJobState extends State<DiscoverJobPage> {
  @override
  initState() {
    super.initState();
  }

  DiscoveryJobListener get _listener => context.findAncestorStateOfType()!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      body: _createDiscoveryLayout(),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const BottomNavBar() : null,
    );
  }

  void _onLoadMoreRequest() {
    _listener.onLoadMoreRequest();
  }

  Widget _createDiscoveryLayout() {
    double maxDisplayCount = (MediaQuery.of(context).size.height) / 100;
    DiscoveryJobScreenState _screenState = context.watch();
    if (_screenState.requests.length < maxDisplayCount) {
      _onLoadMoreRequest();
    }

    RequestModel? selectedRequest = _screenState.selectedRequest ??
        (_screenState.requests.isEmpty ? null : _screenState.requests.first);

    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: EdgeInsets.only(
          left: Responsive.isDesktop(context) ? 100.0 : 0.0,
          top: Responsive.isDesktop(context) ? 30.0 : 5.0,
          right: Responsive.isDesktop(context) ? 100.0 : 0.0,
        ),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RequestIntroList(
                  requests: _screenState.requests,
                  onItemSelected: (request) {
                    _screenState.selectedRequest = request;
                  },
                  onLoadMore: _onLoadMoreRequest,
                ),
                SizedBox(
                  width: 1.0,
                  height: double.infinity,
                  child: Container(
                    color: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(
                  width: Design.headerSpacing,
                ),
                if (selectedRequest != null)
                  JobDetails(
                    request: selectedRequest,
                    onApply: _listener.onBtnApplyClicked,
                  ),
              ],
            )),
      ),
    );
  }
}
