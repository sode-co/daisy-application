import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/pages/discovery-job/deps/discovery_job_page_deps.dart';
import 'package:daisy_application/app/pages/discovery-job/model/discovery_job_screen_state.dart';
import 'package:daisy_application/app/pages/discovery-job/view/stateless_component.dart';
import 'package:daisy_application/app/pages/job-details/model/job_details_state.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({Key? key, RequestModel? request}) : super(key: key);

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  @override
  initState() {
    super.initState();
  }

  DiscoveryJobListener get _listener => context.findAncestorStateOfType()!;
  ApplicationState get _appState => context.read();

  @override
  Widget build(BuildContext context) {
    DiscoveryJobScreenState _screenState = context.watch();
    var x = _screenState.selectedRequest;
    var y = _screenState.applicants;
    var z = _listener.onBtnApplyClicked;
    //  RequestModel? selectedRequest = _appState.currentRequest;

    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => JobDetailsState(),
            ),
            ChangeNotifierProvider(
              create: (context) => DiscoveryJobScreenState(),
            ),
          ],
          child: JobDetails(
            request: _screenState.selectedRequest!,
            onApply: _listener.onBtnApplyClicked,
            applicants: _screenState.applicants ?? [],
          ),
        ),
      ),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const BottomNavBar() : null,
    );
  }
}
