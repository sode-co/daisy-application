import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/work_space/view/work_space_screen.dart';
import 'package:flutter/material.dart';

class WorkspaceCardInfo {
  final Color? buttonColor;
  final String? title;
  final String? image;
  final String? authorName;
  final String? authorAvatar;
  final String? tagName;
  final String? buttonName;
  final bool isDisplayButton;

  WorkspaceCardInfo(
      {this.buttonColor,
      this.title,
      this.image,
      this.tagName,
      this.authorAvatar,
      this.authorName,
      this.isDisplayButton = true,
      this.buttonName});
}

extension CommonComponent on WorkspaceState {
  Widget createInfoCard(WorkspaceCardInfo cardInfo) => Column(
        children: [
          InkWell(
            onTap: () {},
            child: LayoutBuilder(builder: (context, constraint) {
              return Padding(
                padding: const EdgeInsets.all(Design.itemSpacing),
                child: SizedBox(
                  width: size.width * 0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      createItemImage(constraint),
                      const SizedBox(width: Design.bodySpacing),
                      showInfo(cardInfo),
                      Expanded(child: Container()),
                      createButton(cardInfo)
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: Design.headerSpacing),
          createItemDivider()
        ],
      );

  Widget createButton(WorkspaceCardInfo cardInfo) {
    return cardInfo.isDisplayButton
        ? SizedBox(
            height: 45,
            width: 180,
            child: createItemButton(
              buttonText: cardInfo.buttonName!,
              buttonColor: cardInfo.buttonColor!,
            ))
        : Container();
  }

  Widget createItemImage(BoxConstraints constraint) => Container(
        width: constraint.maxWidth * 0.2,
        padding: EdgeInsets.all(constraint.maxWidth * 0.2 * 0.1),
        decoration: BoxDecoration(
            color: Design.colorWhite,
            border:
                Border.all(color: Design.colorNeutral.shade400, width: 0.8)),
        child: Image.asset(
          'assets/images/portfolio/avatar.png',
        ),
      );

  Widget showInfo(WorkspaceCardInfo cardInfo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${cardInfo.title}',
          style: Design.textBody(bold: true),
        ),
        const SizedBox(height: Design.itemSpacing),
        Row(
          children: [
            SizedBox(
              width: Design.textTitle().fontSize,
              child: CircleAvatar(
                backgroundImage: NetworkImage(cardInfo.authorAvatar!),
              ),
            ),
            const SizedBox(
              width: Design.contentSpacing,
            ),
            Text(
              cardInfo.authorName ?? '',
              style: Design.textName(),
            )
          ],
        ),
        const SizedBox(height: 5.0),
        Text('', style: Design.textBody()),
        const SizedBox(height: 10.0),
        createItemTag(cardInfo)
      ],
    );
  }

  Widget createItemTag(WorkspaceCardInfo cardInfo) => Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(2)),
            border: Border.all(color: cardInfo.buttonColor!, width: 3)),
        child: Text(
          cardInfo.tagName!,
          style: Design.textButtonSmall(textColor: cardInfo.buttonColor!),
        ),
      );
}
