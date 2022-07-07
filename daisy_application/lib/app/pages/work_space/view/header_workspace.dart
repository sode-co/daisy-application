import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/work_space/view/work_space_screen.dart';
import 'package:flutter/material.dart';

extension HeaderWorkspace on WorkspaceState {
  Widget createWorkspaceHeader() => Container(
        color: Design.headerColor,
        padding: const EdgeInsets.only(
            left: Design.headerSpacing * 2,
            top: Design.headerSpacing,
            bottom: Design.headerSpacing),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Recommended',
                style: Design.textLogo(
                  textColor: Design.colorNeutral.shade900,
                ),
              ),
              const SizedBox(height: Design.headerSpacing),
              Row(
                children: [
                  createHeaderRecommendItem(
                      Image.asset('images/ic_find_person.png'),
                      'Your designers',
                      Design.accentRed.shade400,
                      () => null),
                  const SizedBox(width: Design.headerSpacing),
                  createHeaderRecommendItem(
                      Image.asset('images/ic_friend.png'),
                      'Find new designer',
                      Design.colorPrimary.shade400,
                      () => null)
                ],
              )
            ]),
      );

  Widget createHeaderRecommendItem(
          Image icon, String label, Color color, Function() onClicked) =>
      LayoutBuilder(builder: (context, constraint) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                ),
                child: icon),
            const SizedBox(height: Design.contentSpacing),
            Text(label,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 13, color: Colors.black)),
          ],
        );
      });
}
