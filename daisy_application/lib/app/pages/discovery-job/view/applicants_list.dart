import 'package:daisy_application/app/common/design/design_style.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/pages/admin/constants.dart';
import 'package:daisy_application/core_services/models/job_application/job_application_model.dart';
import 'package:flutter/material.dart';

class ListApplicants extends StatelessWidget {
  final List<JobApplicationModel> applicants;
  const ListApplicants({Key? key, required this.applicants}) : super(key: key);

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
                  style: Design.textBody(),
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
                        'E-mail',
                        style: Design.textTableHeader(
                          textColor: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Số điện thoại',
                        style: Design.textTableHeader(
                          textColor: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Mô tả',
                        style: Design.textTableHeader(
                          textColor: Colors.black.withOpacity(0.6),
                        ),
                      ),
                    ),
                    const DataColumn(
                      label: Text(''),
                    ),
                  ],
                  rows: applicants
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
          Text(
            applicant.freelancer!.email!,
          ),
        ),
        DataCell(
          Text(
            applicant.freelancer!.phone!,
          ),
        ),
        DataCell(
          Text(applicant.description!),
        ),
        DataCell(
          Row(
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.withOpacity(0.5),
                ),
                icon: const Icon(
                  Icons.edit,
                  size: 14,
                ),
                onPressed: () {},
                // Edit
                label: const Text('Edit'),
              ),
              const SizedBox(
                width: 6,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green.withOpacity(0.5),
                ),
                icon: const Icon(
                  Icons.visibility,
                  size: 14,
                ),
                onPressed: () {},
                //View
                label: const Text('View'),
              ),
              const SizedBox(
                width: 6,
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red.withOpacity(0.5),
                ),
                icon: const Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return Theme(
                          data: Theme.of(context)
                              .copyWith(dialogBackgroundColor: Colors.white),
                          child: AlertDialog(
                              title: const Center(
                                child: Text(
                                  'Xác nhận xóa người dùng',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                              content: Container(
                                color: secondaryColor,
                                height: 90,
                                child: Column(
                                  children: [
                                    Text(
                                        "Are you sure want to delete '${applicant.freelancer!.displayName!}'?"),
                                    SizedBox(
                                      height: Responsive.isDesktop(context)
                                          ? 30
                                          : 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton.icon(
                                            icon: const Icon(
                                              Icons.close,
                                              size: 14,
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.grey.shade400,
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            label: const Text('Cancel')),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        ElevatedButton.icon(
                                            icon: const Icon(
                                              Icons.delete,
                                              size: 14,
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.red),
                                            onPressed: () {},
                                            label: const Text('Delete'))
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        );
                      });
                },
                // Delete
                label: const Text('Delete'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
