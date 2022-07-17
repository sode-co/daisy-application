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
        height: 70,
        width: 70,
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
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black87, width: 5),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5))),
          child: TextField(
            controller: discussionTextController,
            cursorWidth: 6,
            maxLines: null,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              prefixText: '   ',
              hintText: 'Type message here',
              hintStyle: TextStyle(
                  fontSize: 30,
                  height: 1.45,
                  color: Design.colorNeutral.shade500),
            ),
            style: const TextStyle(
              fontSize: 30,
              height: 1.45,
            ),
          )));

  Widget createSendButton() => LayoutBuilder(builder: (context, constraint) {
        return SizedBox(
            child: Row(
          children: [
            const SizedBox(width: Design.contentSpacing),
            Container(
              height: 70,
              width: 70,
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
