import 'package:daisy_application/app/pages/find-designer/view/dropdown_category.dart';
import 'package:daisy_application/app/pages/find-designer/view/find_designer.dart';
import 'package:flutter/material.dart';

extension FindDesignerBody on FindDesignerPageState {
  Widget createFindDesignerTab() {
    return Column(
      children: [
        const DropdownList(label: 'Lĩnh vực'),
        DropdownChildrenList(
          parentName:
              screenState.parentCategory?.name ?? 'Nhận diện thương hiệu',
          label: 'Chọn lĩnh vực cụ thể cho đầu việc',
          index: 1,
        ),
      ],
    );
  }
}
