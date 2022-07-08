import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/pages/work_space/model/workspace_tabs.dart';
import 'package:daisy_application/app/pages/work_space/view/work_space_screen.dart';
import 'package:daisy_application/app/router/admin_router.gr.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/name_to_enum.dart';
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      createItemImage(constraint),
                      const SizedBox(width: Design.bodySpacing),
                      showInfo(cardInfo),
                      Expanded(child: Container()),
                      if (Responsive.isDesktop(context)) createButton(cardInfo)
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
            height: 38,
            width: 180,
            child: createItemButton(
              buttonText: cardInfo.buttonName!,
              buttonColor: cardInfo.buttonColor!,
            ))
        : Container();
  }

  Widget createItemImage(BoxConstraints constraint) => Container(
        width: constraint.maxWidth * 0.15,
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
        Container(
          width: 260,
          child: Text(
            '${cardInfo.title}',
            maxLines: 2,
            style: Design.textBody(bold: true),
          ),
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
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(2)),
            border: Border.all(color: cardInfo.buttonColor!, width: 2)),
        child: Text(
          cardInfo.tagName!,
          style: Design.textButtonSmall(textColor: cardInfo.buttonColor!),
        ),
      );

  Widget createItemButton(
          {Function()? onMainBtnClicked,
          Function()? onOptionBtnClicked,
          Color? buttonColor,
          required String buttonText}) =>
      LayoutBuilder(builder: (context, constraint) {
        return Row(
          children: [
            Expanded(
              child: InkWell(
                  onTap: () {},
                  child: Container(
                      height: constraint.maxHeight,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: buttonColor ?? Design.accentRed.shade400,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5))),
                      child: Text(
                        buttonText,
                        style: Design.textButtonSmall(
                            textColor: Design.colorWhite),
                      ))),
            ),
            const SizedBox(width: Design.contentSpacing),
            InkWell(
              onTap: onOptionBtnClicked,
              child: Container(
                  height: constraint.maxHeight,
                  width: constraint.maxWidth * 0.25,
                  decoration: BoxDecoration(
                      color: Design.accentRed.shade400,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  child: const Icon(
                    Icons.more_horiz,
                    color: Design.colorWhite,
                  )),
            )
          ],
        );
      });

  Widget createItemDivider() => Container(
        height: 2,
        decoration: BoxDecoration(color: Design.colorNeutral.shade400),
      );

  Widget getEmptyMessageByTab(WorkspaceTab tab) {
    switch (tab) {
      case WorkspaceTab.AppliedRequest:
      case WorkspaceTab.PostedRequest:
        return createEmptyAllRequestMessage();
      case WorkspaceTab.AllProjects:
      case WorkspaceTab.ActiveProjects:
      case WorkspaceTab.CanceledProjects:
      case WorkspaceTab.DoneProjects:
        return createEmptyAllProjectMessage();
    }
  }

  Widget createEmptyAllRequestMessage({double? width, double? height}) =>
      Container(
          padding: const EdgeInsets.all(Design.contentSpacing),
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              currentUser.role!.toUserRole() == UserRole.CUSTOMER
                  ? Text(
                      'Bạn vẫn chưa đăng tin nào',
                      style: Design.textLogo(),
                    )
                  : Text(
                      'Bạn hiện chưa ứng tuyển dự án',
                      style: Design.textLogo(),
                    ),
              const SizedBox(height: Design.contentSpacing),
              Container(
                width: size.width * 0.2,
                height: 5,
                decoration: const BoxDecoration(color: Colors.black),
              ),
              const SizedBox(height: Design.headerSpacing),
              currentUser.role!.toUserRole() == UserRole.CUSTOMER
                  ? ButtonInfo(
                      text: 'Hãy đăng thêm dự án mới tại đây',
                      onPressed: () =>
                          context.pushRoute(const PostNewJobRoute()),
                    )
                  : ButtonInfo(
                      text: 'Cùng nhau tìm kiếm cơ hội việc làm nào',
                      onPressed: () =>
                          context.pushRoute(const DicoveryJobRoute()),
                    )
            ],
          ));

  Widget createEmptyAllProjectMessage({double? width, double? height}) =>
      Container(
          padding: const EdgeInsets.all(Design.contentSpacing),
          width: width,
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bạn vẫn chưa có dự án nào',
                style: Design.textLogo(),
              ),
              const SizedBox(height: Design.contentSpacing),
              Container(
                width: size.width * 0.2,
                height: 5,
                decoration: const BoxDecoration(color: Colors.black),
              ),
              const SizedBox(height: Design.headerSpacing),
              currentUser.role!.toUserRole() == UserRole.CUSTOMER
                  ? ButtonInfo(
                      text: 'Hãy đăng dự án mới nào',
                      onPressed: () =>
                          context.pushRoute(const PostNewJobRoute()),
                    )
                  : ButtonInfo(
                      text: 'Tìm kiếm dự án mới tại đây',
                      onPressed: () =>
                          context.pushRoute(const DicoveryJobRoute()),
                    )
            ],
          ));
}
