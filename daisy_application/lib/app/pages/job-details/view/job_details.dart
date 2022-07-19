import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/pages/discovery-job/deps/discovery_job_page_deps.dart';
import 'package:daisy_application/app/pages/discovery-job/model/discovery_job_screen_state.dart';
import 'package:daisy_application/app/pages/discovery-job/view/stateless_component.dart';
import 'package:daisy_application/app/pages/job-details/model/job_details_state.dart';
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

  @override
  Widget build(BuildContext context) {
    DiscoveryJobScreenState _screenState = context.watch();
    Size size = MediaQuery.of(context).size;

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
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal:
                    Responsive.isDesktop(context) ? size.width * 0.1 : 0.0,
                vertical: 20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade200),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      Responsive.isDesktop(context) ? size.width * 0.02 : 0.0,
                  vertical:
                      Responsive.isDesktop(context) ? size.height * 0.01 : 0.0,
                ),
                child: JobDetails(
                  request: _screenState.selectedRequest!,
                  onApply: _listener.onBtnApplyClicked,
                  applicants: _screenState.applicants,
                  width: size.width * 0.8,
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const BottomNavBar() : null,
    );
  }
}
