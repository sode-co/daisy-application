import 'dart:math';

import 'package:daisy_application/app/common/utils/widget_utils.dart';
import 'package:daisy_application/app/pages/discovery-job/model/discovery_job_screen_state.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/models/category/category_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/app/listeners/WidgetListener.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daisy_application/app/common/responsive.dart';
import '../deps/discovery_job_page_deps.dart';
import 'stateless_component.dart';

class JobInfoColumn extends StatefulWidget {
  const JobInfoColumn({Key? key}) : super(key: key);

  @override
  State<JobInfoColumn> createState() => _JobInfoColumnState();
}

class _JobInfoColumnState extends State<JobInfoColumn> {
  CategoryModel category = CategoryModel(
    1,
    'category description',
    'Logo',
    'type',
  );
  UserModel user = UserModel(
    1,
    'firstname',
    'lastname',
    'Select Technology, LLC ',
    'email',
    'role',
    'setting',
    'assets/images/portfolio/avatar.png',
    'District 7, Ho Chi Minh City, Vietnam ',
    'phone',
  );
  late RequestModel request = RequestModel(
      category: category,
      title: 'Mobile Application Developer (iOS or/and Android)',
      description:
          'Select Technology is an IoT Solutions Company specializing in Smart City and Home Automation. Headquartered in Dallas, Texas and Remote locations in India, HCM City, and Ha Noi Viet Nam Select Technology has been a pioneer and innovator in IoT technology specifically in Smart Manufacturing, Smart City, and Home Automation. Select Technology’s mission is to provide a state-of-the-art, reliable, and comprehensive Home Automation and Smart City solution. \n\n Select Technology is an IoT Solutions Company specializing in Smart City and Home Automation. Headquartered in Dallas, Texas and Remote locations in India, HCM City, and Ha Noi Viet Nam Select Technology has been a pioneer and innovator in IoT technology specifically in Smart Manufacturing, Smart City, and Home Automation. Select Technology’s mission is to provide a state-of-the-art, reliable, and comprehensive Home Automation and Smart City solution.',
      budget: 1.0,
      status: '1',
      timeline: DateTime.now());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.grey.shade100,
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
          child: Responsive.isDesktop(context)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RequestIntroList(),
                    SizedBox(
                      width: 1.0,
                      height: size.height,
                      child: Container(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    JobDetails(
                      request: request,
                    ),
                  ],
                )
              : Column(
                  children: [
                    const RequestIntroList(),
                    SizedBox(
                      width: 1.0,
                      height: size.height,
                      child: Container(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    JobDetails(
                      request: request,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class RequestIntroList extends StatefulWidget {
  const RequestIntroList({Key? key}) : super(key: key);

  @override
  State<RequestIntroList> createState() => _RequestIntroListState();
}

class _RequestIntroListState extends State<RequestIntroList> {
  late ScrollController loadMoreController;

  _RequestIntroListState() {
    loadMoreController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void initState() {
    super.initState();
    loadMoreController = ScrollController()..addListener(_scrollListener);
    _listener.onLoadMoreRequest();
  }

  void _scrollListener() {
    const ns = 'streaming-request';

    if (loadMoreController.position.extentAfter < 300) {
      Debug.log(ns, 'Controller start loading more request');
      _listener.onLoadMoreRequest();
    }
  }

  DiscoveryJobListener get _listener => context.findAncestorStateOfType()!;
  DiscoveryJobScreenState get _screenState => context.read();

  @override
  Widget build(BuildContext context) {
    double maxDisplayCount = (MediaQuery.of(context).size.height) / 100;
    DiscoveryJobScreenState screenState = context.watch();
    if (_screenState.requests.length < maxDisplayCount) {
      _listener.onLoadMoreRequest();
    }

    return SizedBox(
      width: context.deviceInfo.screenSize.width * 0.3,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 15.0 : 5.0,
          vertical: Responsive.isDesktop(context) ? 15.0 : 5.0,
        ),
        child: ListView.builder(
          controller: loadMoreController,
          itemBuilder: (context, index) =>
              IntroJobCard(request: screenState.requests.elementAt(index)),
          itemCount: screenState.requests.length,
        ),
      ),
    );
  }
}
