import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Loại sản phẩm phổ biến gần đây',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            svgSrc: 'assets/icons/Documents.svg',
            title: 'Bìa đóng tài liệu',
            amountOfFiles: '1.3GB',
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: 'assets/icons/media.svg',
            title: 'Video giới thiệu',
            amountOfFiles: '15.3GB',
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: 'assets/icons/folder.svg',
            title: 'Banner và quảng cáo',
            amountOfFiles: '1.3GB',
            numOfFiles: 1328,
          ),
          StorageInfoCard(
            svgSrc: 'assets/icons/unknown.svg',
            title: 'Thiết kế giao diện front-end',
            amountOfFiles: '1.3GB',
            numOfFiles: 140,
          ),
        ],
      ),
    );
  }
}
