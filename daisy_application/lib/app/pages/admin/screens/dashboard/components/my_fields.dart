import 'package:daisy_application/app/pages/admin/models/MyFiles.dart';
import 'package:daisy_application/app/pages/admin/responsive.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'file_info_card.dart';

class MyFields extends StatelessWidget {
  const MyFields({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SizedBox(
      width: 1000,
      height: 1000,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Thống kê',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Thêm báo cáo mới'),
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Responsive(
            mobile: FileInfoCardGridView(
              crossAxisCount: _size.width < 650 ? 2 : 4,
              childAspectRatio:
                  _size.width < 650 && _size.width > 350 ? 1.3 : 1,
            ),
            tablet: const FileInfoCardGridView(),
            desktop: FileInfoCardGridView(
              childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
