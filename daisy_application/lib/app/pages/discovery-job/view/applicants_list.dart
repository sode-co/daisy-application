import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/design/design_style.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';
import 'package:daisy_application/app/dialogs/alert_dialog.dart';
import 'package:daisy_application/app/pages/admin/constants.dart';
import 'package:daisy_application/app/pages/discovery-job/deps/discovery_job_page_deps.dart';
import 'package:daisy_application/app/router/router.gr.dart';
import 'package:daisy_application/core_services/models/job_application/job_application_model.dart';
import 'package:flutter/material.dart';

class ListApplicants extends StatefulWidget {
  final List<JobApplicationModel> applicants;
  final Function()? onApproveBtnClick;
  const ListApplicants(
      {Key? key, required this.applicants, this.onApproveBtnClick})
      : super(key: key);

  @override
  State<ListApplicants> createState() => _ListApplicantsState();
}

class _ListApplicantsState extends State<ListApplicants> {
  DiscoveryJobListener get _listener => context.findAncestorStateOfType()!;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danh sách ứng viên',
                  style: Design.textSmallHeadline(),
                ),
                DataTable(
                  horizontalMargin: 0,
                  columnSpacing: defaultPadding,
                  columns: [
                    DataColumn(
                      label: Text(
                        'Họ tên',
                        style: Design.textTableHeader(
                          textColor: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Xem portfolio',
                        style: Design.textTableHeader(
                          textColor: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Trạng thái',
                        style: Design.textTableHeader(
                          textColor: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                  rows: widget.applicants
                      .map((user) => applicantDataRow(user, context))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DataRow applicantDataRow(
      JobApplicationModel applicant, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              Image.network(applicant.freelancer!.avatar!),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(
                  applicant.freelancer!.displayName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        DataCell(
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 52, 155, 55),
            ),
            icon: const Icon(
              Icons.recommend,
              size: 14,
            ),
            onPressed: () {
              _listener
                  .getPortfolioByDesignerEmail(applicant.freelancer!.email!);
            },
            // Edit
            label: const Text('Portfolio'),
          ),
        ),
        if (applicant.status == 'PENDING')
          DataCell(
            Row(
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue.withOpacity(0.5),
                  ),
                  icon: const Icon(
                    Icons.recommend,
                    size: 14,
                  ),
                  onPressed: () {
                    _listener.onBtnApproveJobApplication(applicant.request,
                        applicant.request!.id!, applicant!.freelancer!.email!);
                  },
                  // Edit
                  label: const Text('Duyệt'),
                ),
                const SizedBox(
                  width: 6,
                ),
                const SizedBox(
                  width: 6,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red.withOpacity(0.5),
                  ),
                  icon: const Icon(
                    Icons.highlight_off,
                    size: 14,
                  ),
                  onPressed: () {
                    context.show(
                      DialogAlert.error(
                        context,
                        title: 'Xác nhận từ chối đơn ',
                        message:
                            'Bạn có chắc muốn từ chối ${applicant.freelancer!.displayName}',
                        affirmativeText: 'Từ chối',
                        negativeText: 'Hủy bỏ',
                        onAffirmativeClicked: () {
                          context.pushRoute(DicoveryJobRoute(request: null));
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        onNegativeClicked: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    );
                  },
                  // Delete
                  label: const Text('Từ chối'),
                ),
              ],
            ),
          ),
        if (applicant.status != 'PENDING')
          DataCell(
            Text(applicant.status!),
          ),
      ],
    );
  }
}
