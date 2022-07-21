import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/pages/find-designer/view/designer_result_card.dart';
import 'package:daisy_application/app/pages/find-designer/view/dropdown_category.dart';
import 'package:daisy_application/app/pages/find-designer/view/find_designer.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';

extension FindDesignerBody on FindDesignerPageState {
  Widget createFindDesignerTab() {
    Size size = MediaQuery.of(context).size;
    UserModel? user;
    return Responsive.isDesktop(context)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const DropdownList(label: 'Lĩnh vực'),
                  DropdownChildrenList(
                    parentName: screenState.parentCategory?.name ??
                        'Nhận diện thương hiệu',
                    label: 'Chọn lĩnh vực cụ thể cho đầu việc',
                    index: 1,
                  ),
                ],
              ),
              SingleChildScrollView(
                child: SizedBox(
                  width: size.width * 0.6,
                  height: size.height,
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(100, (index) {
                      return Center(
                        child: createDesignerCard(user),
                      );
                    }),
                  ),
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const DropdownList(label: 'Lĩnh vực'),
                  DropdownChildrenList(
                    parentName: screenState.parentCategory?.name ??
                        'Nhận diện thương hiệu',
                    label: 'Chọn lĩnh vực cụ thể',
                    index: 1,
                  ),
                ],
              ),
              SingleChildScrollView(
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.45,
                  child: GridView.count(
                    crossAxisCount: 1,
                    children: List.generate(100, (index) {
                      return Center(
                        child: createDesignerCard(user),
                      );
                    }),
                  ),
                ),
              ),
            ],
          );
  }
}
