import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/design/design_snackbar.dart';
import 'package:daisy_application/app/pages/update-profile/deps/update_profile_deps.dart';
import 'package:daisy_application/app/pages/update-profile/model/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProfileFlowController extends AutoRouter {
  const UpdateProfileFlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => _UpdateProfileFlowControllerState();
}

class _UpdateProfileFlowControllerState extends AutoRouterState
    implements UpdateProfileListener<AutoRouter> {
  UpdateProfileState? profileState;
  @override
  void initState() {
    profileState = UpdateProfileState();
    super.initState();
  }

  @override
  void dispose() {
    profileState = null;
    super.dispose();
  }

  @override
  void onBtnUpdateProfileClicked() => _updateProfile();

  Future<void> _updateProfile() async {
    // RequestRestApi _userClient = locator.get();
    // Debug.log.log('update profile');
    // await _userClient.updateUser(profileState!.parentRequest);
    context.toastSuccess('Cập nhật profile thành công');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: ((context) => profileState!))],
      child: super.build(context),
    );
  }
}
