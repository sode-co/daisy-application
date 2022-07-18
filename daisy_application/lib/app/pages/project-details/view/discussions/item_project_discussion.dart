import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:daisy_application/common/to_string_utils.dart';
import 'package:daisy_application/core_services/models/discussion/discussion_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:daisy_application/common/access_utils.dart';
import 'package:daisy_application/common/safety_utils.dart';
import 'package:daisy_application/app/common/design/design_button.dart';

/// This file is used to define all of items of discussion
/// Draw items depend on the contentType field
extension ItemProjectDiscussion on ProjectDetailsPageState {
  Widget createDiscussionItem(BuildContext context, int index) {
    List<DiscussionModel> discussions = screenState.discussions;

    return _createTextMessageItem(discussions[index]);
  }

  Widget _createTextMessageItem(DiscussionModel discussion) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: Design.contentSpacing),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _createMessageTitleComponent(discussion),
              const SizedBox(height: Design.contentSpacing),
              Padding(
                padding: const EdgeInsets.only(left: Design.headerSpacing * 2),
                child:
                    Text(discussion.content ?? '', style: Design.textButton()),
              ),
              const SizedBox(height: Design.headerSpacing),
            ],
          ),
        ],
      );

  Widget _createMessageTitleComponent(DiscussionModel discussion) {
    String displayTime =
        discussion.createdAt?.getDisplayTime().toString() ?? '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: Design.headerSpacing * 1.5,
          child: CircleAvatar(
            backgroundImage: discussion.sender?.avatar == null
                ? Image.asset('assets/images/ic_default_ava.png').image
                : NetworkImage(discussion.sender!.avatar!),
          ),
        ),
        const SizedBox(
          width: Design.itemSpacing,
        ),
        Text(
          discussion.sender?.displayName ?? '',
          style: Design.textButton(),
        ),
        const SizedBox(
          width: Design.contentSpacing,
        ),
        Text(displayTime,
            style: TextStyle(
              color: Design.colorNeutral.shade700,
              fontSize: 20,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            )),
      ],
    );
  }
}
