import 'package:daisy_application/app/common/colors.dart';
import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/style.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';
import 'package:daisy_application/app/pages/discovery-job/deps/discovery_job_page_deps.dart';
import 'package:daisy_application/app/pages/discovery-job/model/discovery_job_screen_state.dart';
import 'package:daisy_application/app/pages/discovery-job/view/applicants_list.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/access_utils.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/core_services/models/job_application/job_application_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroJobCard extends StatelessWidget {
  final Function(RequestModel)? onItemSelected;
  const IntroJobCard({Key? key, required this.request, this.onItemSelected})
      : super(key: key);
  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    DiscoveryJobScreenState _screenState = context.watch();
    RequestModel? selectedRequest = _screenState.selectedRequest ??
        (_screenState.requests.isEmpty ? null : _screenState.requests.first);

    return Padding(
      padding: const EdgeInsets.only(top: Design.itemSpacing),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          color: request.id == selectedRequest!.id
              ? const Color(0xffa8d4ff).withOpacity(0.5)
              : Colors.white,
          child: InkWell(
            onTap: () => onItemSelected.then(() => onItemSelected!(request)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isDesktop(context) ? 30.0 : 10.0,
                  vertical: Responsive.isDesktop(context) ? 20.0 : 10.0),
              child: SizedBox(
                width: context.isScreenType(ScreenType.DESKTOP) ? 400.0 : 380.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60.0,
                      width: 60.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          request.customer!.avatar!,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            '${request.title}',
                            style: Design.textBodyBold(),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          width: 280,
                          child: Text(
                            request.description ?? '',
                            style: Design.textBody(),
                          ),
                        ),
                        SizedBox(
                          width: 280,
                          child: Text(
                            '',
                            style: Design.textBody(),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.event_available,
                                color: Colors.green),
                            const SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              request.status ?? '',
                              style: Design.textBody(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2.0,
                        ),
                        Container(
                          color: Colors.grey.withOpacity(0.3),
                          child: const SizedBox(width: 300, height: 1.0),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DisplayTime {
  final String name;
  final int number;

  _DisplayTime(this.name, this.number);

  @override
  String toString() => '$number $name ago';
}

class JobDetails extends StatefulWidget {
  final VoidCallback? onApply;
  const JobDetails(
      {Key? key,
      required this.request,
      this.onApply,
      required this.applicants,
      this.width})
      : super(key: key);
  final RequestModel request;
  final List<JobApplicationModel>? applicants;
  final double? width;
  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  DiscoveryJobListener get _listener => context.findAncestorStateOfType()!;

  @override
  initState() {
    super.initState();
    _listener.onLoadListApplicants(widget.request.id);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _DisplayTime displayTime;

    double weeksCount = ((DateTime.now().millisecondsSinceEpoch -
            widget.request.createdAt!.millisecondsSinceEpoch) /
        (1000 * 60 * 60 * 24) /
        7);

    if (weeksCount > 1) {
      displayTime = _DisplayTime('weeks', weeksCount.toInt());
    } else if (weeksCount * 7 > 1) {
      displayTime = _DisplayTime('days', (weeksCount * 7).toInt());
    } else {
      displayTime = _DisplayTime('hours', (weeksCount * 7 * 24).toInt());
    }

    return Padding(
      padding: const EdgeInsets.only(top: Design.headerSpacing),
      child: SizedBox(
        width: widget.width ??
            (Responsive.isDesktop(context) ? size.width * 0.57 : size.width),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.8,
                child: Text(
                  widget.request.title ?? '',
                  style: Design.textTitle(),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(' ', style: Design.textBody()),
                  Text(
                    displayTime.toString(),
                    style: Style.lightSmallString,
                  ),
                ],
              ),
              if (Responsive.isDesktop(context))
                const SizedBox(height: Design.bodySpacing),
              Row(
                children: const [
                  Icon(Icons.work_outline),
                  SizedBox(width: Design.contentSpacing),
                  Text('Freelance'),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.tips_and_updates_outlined),
                  SizedBox(width: Design.contentSpacing),
                  Text('You match this job')
                ],
              ),
              if (widget.request.status == 'AVAILABLE')
                const SizedBox(height: Design.headerSpacing),
              if (widget.request.status == 'AVAILABLE')
                ApplicationButton(onApply: widget.onApply),
              const SizedBox(height: Design.headerSpacing),
              Text(
                'Phân loại:',
                style: Design.textSmallHeadline(),
              ),
              const SizedBox(height: Design.contentSpacing),
              Text(
                widget.request.category?.name ?? '',
                style: Design.textBody(),
              ),
              const SizedBox(height: Design.headerSpacing),
              Text(
                'Mô tả chi tiết:',
                style: Design.textSmallHeadline(),
              ),
              const SizedBox(height: Design.contentSpacing),
              Text(
                widget.request.description ?? '',
                style: Design.textBody(),
              ),
              const SizedBox(height: Design.headerSpacing),
              Text(
                'Thông tin người tuyển dụng',
                style: Design.textSmallHeadline(),
              ),
              const SizedBox(height: Design.contentSpacing),
              RecruiterInfo(request: widget.request),
              const SizedBox(
                height: Design.contentSpacing,
              ),
              if (widget.applicants == null)
                Text(
                  'Chưa có ứng viên nào ứng tuyển cho vị trí này',
                  style: Design.textBody(),
                ),
              const SizedBox(height: Design.headerSpacing),
              if (widget.applicants!.isNotEmpty)
                ListApplicants(applicants: widget.applicants ?? [])
              else
                Text(
                  'Chưa có ứng viên nào ứng tuyển cho vị trí này',
                  style: Design.textBody(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecruiterInfo extends StatelessWidget {
  const RecruiterInfo({
    Key? key,
    required this.request,
  }) : super(key: key);

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Padding(
          padding: EdgeInsets.only(
            left: Design.contentSpacing,
            top: Responsive.isDesktop(context) ? 0.0 : 25.0,
          ),
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height:
                      Responsive.isDesktop(context) ? double.infinity : 50.0,
                  width: Responsive.isDesktop(context) ? 80.0 : 50.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      request.customer?.avatar ??
                          'https://firebasestorage.googleapis.com/v0/b/test-37ba6.appspot.com/o/Cat03.jpg?alt=media&token=143bae7b-74d9-44d5-a73f-4eb1ba3fc1ab',
                    ),
                  ),
                ),
                if (Responsive.isDesktop(context))
                  const SizedBox(width: Design.contentSpacing),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.customer?.displayName ?? 'Lorem ipsum dolor',
                        style: Design.textBodyLarge(bold: true),
                      ),
                      const SizedBox(
                        height: Design.contentSpacing,
                      ),
                      Text(
                        request.customer?.email ?? 'ipsumdolor@gmail.com',
                        style: Design.textBody(),
                      ),
                      const SizedBox(
                        height: Design.contentSpacing,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ApplicationButton extends StatelessWidget {
  final VoidCallback? onApply;
  const ApplicationButton({
    Key? key,
    this.onApply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApplicationState appState = context.read();
    bool isDesigner = (appState.currentUser != null &&
        appState.currentUser!.role == 'DESIGNER');
    return isDesigner
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(BuiltinColor.blue_gradient_01),
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SizedBox(
              width: 200.0,
              height: 50.0,
              child: TextButton.icon(
                icon: const Icon(
                  Icons.approval,
                  color: Color(BuiltinColor.blue_gradient_01),
                ),
                label: const Text(
                  'Ứng tuyển ngay',
                  style: TextStyle(
                    color: Color(BuiltinColor.blue_gradient_01),
                  ),
                ),
                onPressed: onApply,
              ),
            ),
          )
        : Container();
  }
}
