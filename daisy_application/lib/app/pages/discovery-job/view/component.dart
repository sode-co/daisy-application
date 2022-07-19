import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

import 'stateless_component.dart';

class RequestIntroList extends StatefulWidget {
  final Function(RequestModel request)? onItemSelected;
  final VoidCallback? onLoadMore;
  final List<RequestModel> requests;

  const RequestIntroList(
      {Key? key, this.onItemSelected, this.onLoadMore, required this.requests})
      : super(key: key);

  @override
  State<RequestIntroList> createState() => _RequestIntroListState();
}

class _RequestIntroListState extends State<RequestIntroList> {
  late ScrollController scrollController;

  _RequestIntroListState() {
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 300) {
      if (widget.onLoadMore != null) {
        widget.onLoadMore!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isDesktop(context)
          ? context.deviceInfo.screenSize.width * 0.28
          : context.deviceInfo.screenSize.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: Responsive.isDesktop(context) ? 15.0 : 5.0,
        ),
        child: ListView.builder(
          controller: scrollController,
          itemBuilder: (context, index) => IntroJobCard(
            onItemSelected: widget.onItemSelected,
            request: widget.requests.elementAt(index),
          ),
          itemCount: widget.requests.length,
        ),
      ),
    );
  }
}
