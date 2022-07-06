import 'package:daisy_application/app/common/responsive.dart';
import 'package:daisy_application/app/common/widget/bottom_nav/bottomnavbar.dart';
import 'package:daisy_application/app/common/widget/header/header.dart';
import 'package:daisy_application/app/listeners/WidgetListener.dart';
import 'package:daisy_application/app/pages/update-profile/deps/update_profile_deps.dart';
import 'package:daisy_application/app/pages/update-profile/model/update_profile_state.dart';
import 'package:daisy_application/app/pages/update-profile/view/component.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);
  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> with WidgetListener {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ApplicationState appState = context.watch();
    UserModel currentUser = appState.currentUser!;
    var model = context.watch<UpdateProfileState>();

    return Scaffold(
      appBar: const Header(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.1, right: size.width * 0.05, top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UpdateProfileTitle(),
              SizedBox(
                width: size.width * 0.9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UpdateProfileForm(
                      onSubmitted: () {
                        listener
                            .onBtnUpdateProfileClicked(model.updatedProfile);
                      },
                    ),
                    const UserAvatar(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          !Responsive.isDesktop(context) ? const BottomNavBar() : null,
    );
  }

  UpdateProfileListener get listener => context.findAncestorStateOfType()!;
}
