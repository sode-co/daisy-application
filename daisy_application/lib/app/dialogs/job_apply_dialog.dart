import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/utils/size_mode.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';

class JobApplyDialog extends Dialog {
  final BuildContext context;
  final RequestModel request;
  late TextEditingController descriptionController;
  final UserModel user;
  final Function(UserModel user, String description)? onConfirmClicked;

  JobApplyDialog(this.context, this.request, this.user, this.onConfirmClicked,
      {Key? key})
      : super(key: key) {
    descriptionController = TextEditingController();
  }

  @override
  ShapeBorder? get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget? get child => Container(
        padding: const EdgeInsets.all(Design.headerSpacing),
        width: context.deviceInfo.screenSize.width * 0.6,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _createHeader(),
                _createHeaderDivider(),
                const SizedBox(height: Design.headerSpacing),
                _createContactInfo(),
                const SizedBox(height: Design.headerSpacing),
                createMessageBox(),
                const SizedBox(height: Design.bodySpacing),
                createFooter(),
                const SizedBox(height: Design.headerSpacing),
                createSubmitButton()
              ]),
        ),
      );

  Widget _createDivider() => Container(
        margin: const EdgeInsets.only(top: Design.contentSpacing),
        decoration: BoxDecoration(
            color: Design.fontColorLowEmp,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        height: 1,
      );

  Widget _createHeaderDivider() => Column(
        children: [
          _createDivider(),
          const SizedBox(height: Design.headerSpacing),
          Container(
            decoration: BoxDecoration(
                color: Design.fontColorLowEmp,
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            height: 10,
          ),
        ],
      );

  Widget _createHeader() => Row(children: [
        Expanded(
          child: Text('Easy to apply',
              style:
                  Design.textTitle(textColor: Design.colorBlack, bold: false)),
        ),
        IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop()),
      ]);

  Widget _createContactInfo() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Thông tin liên lạc',
              style: Design.textSmallHeadline(bold: true)),
          const SizedBox(
            height: Design.contentSpacing,
          ),
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: Design.contentSpacing),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 65,
                    height: 65,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar ?? ''),
                    ),
                  ),
                  const SizedBox(
                    width: Design.contentSpacing,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.displayName ?? '',
                        style: Design.textBodyLarge(bold: true),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        user.address ?? '',
                        style: Design.textCaption(),
                      )
                    ],
                  )
                ],
              )),
          const SizedBox(
            height: Design.headerSpacing,
          ),
          createEmailSelector(),
          const SizedBox(
            height: Design.itemSpacing,
          ),
          Row(
            children: [
              Expanded(child: createPhoneSelector()),
              const SizedBox(width: Design.contentSpacing),
              Expanded(child: createAddressSelector())
            ],
          )
        ],
      );

  Widget createEmailSelector() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email address*',
            style: Design.textBody(),
          ),
          const SizedBox(
            height: Design.contentSpacing,
          ),
          DropdownList(
              height: 30, items: [DropDownItem(user.email, user.email ?? '')])
        ],
      );

  Widget createPhoneSelector() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phone number*',
            style: Design.textBody(),
          ),
          const SizedBox(
            height: Design.contentSpacing,
          ),
          DropdownList(
              height: 30, items: [DropDownItem(user.phone, user.phone ?? '')])
        ],
      );

  Widget createAddressSelector() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address *',
            style: Design.textBody(),
          ),
          const SizedBox(
            height: Design.contentSpacing,
          ),
          DropdownList(
              height: 30,
              items: [DropDownItem(user.address, user.address ?? '')])
        ],
      );

  Widget createFooter() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Những chỉnh sửa của bạn ở đây sẽ không làm thay đổi thông tin trong profile chính.',
            style: Design.textCaption(),
          ),
          const SizedBox(
            height: Design.contentSpacing,
          ),
          Text(
            'Application powered by Slimair',
            style: Design.textCaption(),
          ),
        ],
      );

  Widget createSubmitButton() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ButtonPrimary(
            width: 120,
            height: 45,
            fontSize: Design.textBody().fontSize,
            text: 'Ứng tuyển',
            onPressed: onConfirmClicked == null
                ? null
                : () => onConfirmClicked!(user, descriptionController.text),
            textColor: Colors.white,
          )
        ],
      );

  Widget createMessageBox() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lời nhắn',
            style: Design.textCaption(),
          ),
          const SizedBox(
            height: Design.contentSpacing,
          ),
          BasicTextField(
            widthMode: WidthMode.MATCH_PARENT,
            controller: descriptionController,
            maxLines: 4,
            hintText: DEFAULT_APPLICATION_MESSAGE,
          ),
        ],
      );
}
