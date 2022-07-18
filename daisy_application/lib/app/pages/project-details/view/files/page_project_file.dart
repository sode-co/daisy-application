import 'package:daisy_application/app/common/design/design.dart';
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: screenState.currentProjectTab.resources.length,
          itemBuilder: (ctx, index) {
            return Container();
          }));

  void switchFileTab(int index) {
    filePageController.animateToPage(index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn);
    screenState.currentFileTabIndex = index;
  }
}
