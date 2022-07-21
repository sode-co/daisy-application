import 'package:daisy_application/app/common/design/design_style.dart';
import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/pages/find-designer/view/find_designer.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';

extension DesignerInfoCard on FindDesignerPageState {
  Widget createDesignerCard(UserModel? user) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 5.0,
      child: SingleChildScrollView(
        child: SizedBox(
          height: Responsive.isDesktop(context) ? 400 : 450,
          width: Responsive.isDesktop(context) ? 270 : size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: Responsive.isDesktop(context) ? 250 : size.width,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          user?.avatar ?? 'https://i.ibb.co/s30H0fs/images.png',
                        ),
                      ),
                      SizedBox(
                          width: 180,
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user?.displayName ?? 'Lorem Ipsum',
                                style: Design.textBody(),
                              ),
                              createItemTag(
                                  'Matched designer', Colors.blueGrey),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              Image.network(
                height: 300,
                'https://i.ibb.co/2vfqLk2/il-570x-N-2471657126-2p46.webp',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createItemTag(String text, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(2)),
            border: Border.all(color: color, width: 1)),
        child: Text(
          text,
          style: Design.textTagSmall(textColor: color),
        ),
      );
}
