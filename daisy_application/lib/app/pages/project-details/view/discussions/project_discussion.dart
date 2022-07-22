import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/pages/project-details/model/project_details_state.dart';
import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/models/discussion/discussion_model.dart';
import 'package:flutter/material.dart';
import 'package:daisy_application/app/pages/project-details/view/discussions/item_project_discussion.dart';
import 'package:mime_type/mime_type.dart';

extension ProjectDiscussion on ProjectDetailsPageState {
  Widget createProjectDiscussionTab() {
    return Column(
      children: [
        createDiscussionListView(),
        createChatBox(),
      ],
    );
  }

  void onDiscussionListScroll() {
    Debug.log(
        'discussion offset', discussionScrollController!.position.extentBefore);
    if (discussionScrollController!.position.extentAfter < 100) {
      _loadMoreDiscussion();
    }
  }

  void _loadMoreDiscussion() {
    listener.onLoadMoreDicussion();
  }

  Widget createDiscussionListView() {
    double maxDisplayCount = (MediaQuery.of(context).size.height - 200) / 100;
    if (screenState.discussions.length < maxDisplayCount) {
      _loadMoreDiscussion();
    }

    return Expanded(
        child: ListView.builder(
      reverse: true,
      physics: const ClampingScrollPhysics(),
      controller: discussionScrollController,
      itemBuilder: createDiscussionItem,
      itemCount: screenState.discussions.length,
    ));
  }

  Widget createChatBox() => LayoutBuilder(builder: (context, constraint) {
        return SizedBox(
          width: MediaQuery.of(context).size.width -
              Design.alignmentSpacing(context) * 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              createUploadResourceButton(),
              createTextBox(),
              createSendButton()
            ],
          ),
        );
      });

  Widget createUploadResourceButton() => Container(
        height: 58,
        width: 58,
        decoration: const BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), bottomLeft: Radius.circular(5))),
        child: IconButton(
          onPressed: () {},
          icon: const RotatedBox(
              quarterTurns: 2,
              child: Icon(Icons.download, color: Design.colorWhite)),
          color: Colors.white,
        ),
      );

  Widget createTextBox() => Expanded(
          child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 120, minHeight: 40),
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black87, width: 5),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
            child: TextField(
              scrollPadding: const EdgeInsets.all(0),
              controller: discussionTextController,
              cursorWidth: 4,
              enabled: !screenState.project!.isComplete,
              maxLines: null,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixText: '   ',
                suffixText: '   ',
                hintText: screenState.project!.isComplete
                    ? 'This discussion has been locked'
                    : 'Type message here',
                hintStyle: TextStyle(
                    fontSize: 17,
                    height: 1,
                    color: Design.colorNeutral.shade500),
              ),
              style: const TextStyle(
                fontSize: 17,
                height: 1,
              ),
            )),
      ));

  Widget createSendButton() => LayoutBuilder(builder: (context, constraint) {
        return SizedBox(
            child: Row(
          children: [
            const SizedBox(width: Design.contentSpacing),
            Container(
              height: 58,
              width: 58,
              decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: IconButton(
                onPressed: () async {
                  listener.onBtnSendDiscussion(discussionTextController.text);
                },
                icon: const Icon(Icons.send, color: Design.colorWhite),
                color: Colors.white,
              ),
            ),
          ],
        ));
      });
}
