import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/design/design_snackbar.dart';
import 'package:daisy_application/app/pages/update-profile/deps/update_profile_deps.dart';
import 'package:daisy_application/app/pages/update-profile/model/update_profile_state.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/http/users/users_rest_api.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/service_locator/locator.dart';
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
  void onBtnUpdateProfileClicked(int id, UserModel user) =>
      _updateProfile(id, user);

  Future<void> _updateProfile(int id, UserModel user) async {
    UsersRestApi _usersClient = locator.get();
    Debug.log('update profile');
    await _usersClient.updateUser(id, user);
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
