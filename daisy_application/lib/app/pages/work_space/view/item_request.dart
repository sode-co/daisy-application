import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/work_space/view/work_space_screen.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:flutter/material.dart';

extension ItemRequest on WorkspaceState {
  Widget createRequestItem(RequestModel request) => InkWell(
        onTap: () {},
        child: LayoutBuilder(builder: (context, constraint) {
          return Padding(
            padding: const EdgeInsets.all(Design.itemSpacing),
            child: SizedBox(
              width: size.width * 0.9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: constraint.maxWidth * 0.2,
                    padding: EdgeInsets.all(constraint.maxWidth * 0.2 * 0.1),
                    decoration: BoxDecoration(
                        color: Design.colorWhite,
                        border: Border.all(
                            color: Design.colorNeutral.shade400, width: 0.8)),
                    child: Image.asset(
                      request.customer?.avatar ?? '',
                    ),
                  ),
                  const SizedBox(width: Design.bodySpacing),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${request.title}',
                        style: Design.textBody(bold: true),
                      ),
                      const SizedBox(height: Design.itemSpacing),
                      Row(
                        children: [
                          SizedBox(
                            width: Design.textTitle().fontSize,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(request.customer!.avatar!),
                            ),
                          ),
                          const SizedBox(
                            width: Design.contentSpacing,
                          ),
                          Text(
                            request.customer?.displayName ??
                                request.customer?.firstName ??
                                '',
                            style: Design.textName(),
                          )
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text('', style: Design.textBody()),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      );
}
