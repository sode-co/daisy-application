import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:daisy_application/core_services/models/payments/payment_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

extension ProjectPayment on ProjectDetailsPageState {
  PaymentModel? get payment => screenState.project?.payment;

  Widget createProjectPaymentTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _createBillingHeader(),
        const SizedBox(height: Design.itemSpacing),
        Divider(
          thickness: 5,
          color: Colors.grey.shade300,
        ),
        const SizedBox(height: Design.headerSpacing),
        Text('Services', style: Design.textBodyFold()),
        const SizedBox(height: Design.bodySpacing),
        ...(screenState.project?.request?.items
                    .map((e) => _createServiceItem(e)) ??
                [])
            .toList()
      ],
    );
  }

  Widget _createBillingHeader() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _createBillingHeaderItem(
            title: 'Total',
            content:
                '\$${payment?.totalAmount ?? 'loading...'} ${payment?.currency ?? 'VND'}',
          ),
          const SizedBox(width: Design.headerSpacing),
          _createBillingHeaderItem(
            title: 'Paid',
            content:
                '\$${payment?.amount ?? 'loading...'} ${payment?.currency ?? 'VND'}',
          ),
          Expanded(child: Container()),
          _completeProjectButton()
        ],
      );

  Widget _createBillingHeaderItem(
          {required String title, required String content}) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Design.textBodyFold()),
          const SizedBox(height: Design.contentSpacing),
          Text(content, style: Design.textHeadline(bold: true)),
        ],
      );

  Widget _completeProjectButton() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Action', style: Design.textBodyFold())),
          const SizedBox(
            height: Design.contentSpacing,
          ),
          MaterialButton(
            onPressed: () {
              listener.onBtnCompleteProjectClicked();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Design.contentSpacing,
                  vertical: Design.contentSpacing),
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: const BorderRadius.all(Radius.circular(4))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.file_download_done_sharp, size: 20),
                  Text(
                    'Complete project',
                    style: Design.textButtonSmall(),
                  )
                ],
              ),
            ),
          )
        ],
      );

  Widget _createServiceItem(RequestModel request) => Container(
        padding: const EdgeInsets.symmetric(vertical: Design.bodyMobileSpacing),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  request.title ?? 'unknown',
                  style: Design.textHeadline(),
                )
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.grey.shade200,
            )
          ],
        ),
      );
}
