import 'package:daisy_application/app/common/design/design.dart';
import 'package:flutter/material.dart';
import 'package:daisy_application/app/common/utils/widget_utils.dart';

class JobApplyDialog extends Dialog {
  final BuildContext context;

  JobApplyDialog(this.context);

  @override
  ShapeBorder? get shape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));

  @override
  Widget? get child => Container(
        padding: const EdgeInsets.all(Design.headerSpacing),
        width: context.deviceInfo.screenSize.width * 0.6,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _createHeader(),
              _createHeaderDivider(),
              const SizedBox(height: Design.headerSpacing),
              _createContactInfo(),
              const SizedBox(height: Design.headerSpacing),
              createFooter(),
              const SizedBox(height: Design.headerSpacing),
              createSubmitButton()
            ]),
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
          onPressed: () {},
        ),
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
                  const SizedBox(
                    width: 65,
                    height: 65,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(''),
                    ),
                  ),
                  const SizedBox(
                    width: Design.contentSpacing,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Minh Tien Dang',
                        style: Design.textBodyLarge(bold: true),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        'Ho Chi Minh City, VietNam',
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
              height: 30,
              items: [DropDownItem('tiendang', 'tiendvlp@gmail.com')])
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
              height: 30, items: [DropDownItem('tiendang', '0969747887')])
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
              items: [DropDownItem('tiendang', '730/34, Ho Chi Minh City')])
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
            width: 60,
            fontSize: Design.textBody().fontSize,
            text: 'Apply',
            textColor: Colors.white,
          )
        ],
      );
}
