import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/pages/project-details/view/files/item_project_file.dart';
import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:flutter/material.dart';

extension PageProjectFile on ProjectDetailsPageState {
  void initFilePageView() {}

  Widget createProjectFilePageView({required List<String> items}) {
    int index = 0;
    return Expanded(
      child: PageView(
          controller: filePageController,
          children: items.map((e) {
            return createProjectFilePage(index++);
          }).toList()),
    );
  }

  Widget createProjectFilePage(int index) => Container(
      alignment: Alignment.center,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (9 / 11),
            crossAxisCount: Responsive.isDesktop(context) ? 4 : 2,
          ),
          itemCount: screenState.currentProjectTab.resources.length,
          itemBuilder: (ctx, index) {
            return createProjectResourceItem(
                screenState.currentProjectTab.resources[index]);
          }));

  void switchFileTab(int index) {
    filePageController.animateToPage(index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn);
    screenState.currentFileTabIndex = index;
    listener.onFileNavTabSelected(index);
  }
}
