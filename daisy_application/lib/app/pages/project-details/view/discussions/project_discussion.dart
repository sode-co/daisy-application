import 'package:daisy_application/app/common/design/design.dart';
import 'package:daisy_application/app/common/utils/size_mode.dart';
import 'package:daisy_application/app/pages/project-details/view/project_details.dart';
import 'package:flutter/material.dart';
import 'package:daisy_application/app/pages/project-details/view/discussions/item_project_discussion.dart';

extension ProjectDiscussion on ProjectDetailsPageState {
  Widget createProjectDiscussionTab() {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          reverse: true,
          itemBuilder: createDiscussionItem,
          itemCount: screenState.discussions.length,
        )),
        createChatBox()
      ],
    );
  }

  Widget _createDiscussionSparator(BuildContext context, int index) =>
      Container(
        height: Design.itemSpacing,
      );

  Widget createChatBox() => Row(
        children: [_createMessageBox()],
      );

  Widget _createMessageBox() => LayoutBuilder(builder: (context, constraint) {
        return SizedBox(
            width: MediaQuery.of(context).size.width -
                Design.alignmentSpacing(context) * 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5))),
                  child: IconButton(
                    onPressed: () {},
                    icon: const RotatedBox(
                        quarterTurns: 2,
                        child: Icon(Icons.download, color: Design.colorWhite)),
                    color: Colors.white,
                  ),
                ),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black87, width: 5),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5))),
                        child: TextField(
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
                        ))),
                const SizedBox(width: Design.contentSpacing),
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send, color: Design.colorWhite),
                    color: Colors.white,
                  ),
                ),
              ],
            ));
      });
}
