import 'package:daisy_application/app/pages/admin/models/RecentFile.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SizedBox(
        width: 1000,
        height: 1000,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Báo cáo gần đây',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              width: double.infinity,
              child: DataTable2(
                columnSpacing: defaultPadding,
                minWidth: 600,
                columns: const [
                  DataColumn(
                    label: Text('Tên tập tin'),
                  ),
                  DataColumn(
                    label: Text('Ngày tạo'),
                  ),
                  DataColumn(
                    label: Text('Dung lượng'),
                  ),
                ],
                rows: List.generate(
                  demoRecentFiles.length,
                  (index) => recentFileDataRow(demoRecentFiles[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}
