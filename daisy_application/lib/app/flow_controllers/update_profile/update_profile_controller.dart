import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/app/common/design/design_snackbar.dart';
import 'package:daisy_application/app/foundation/flow_controller.dart';
import 'package:daisy_application/app/pages/update-profile/deps/update_profile_deps.dart';
import 'package:daisy_application/app/pages/update-profile/model/update_profile_state.dart';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/http/users/users_rest_api.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/domain-services/authentication-service.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateProfileFlowController extends FlowController {
  const UpdateProfileFlowController({Key? key}) : super(key: key);

  @override
  AutoRouterState createState() => _UpdateProfileFlowControllerState();
}

class _UpdateProfileFlowControllerState extends FlowControllerState
    implements UpdateProfileListener<AutoRouter> {
  UpdateProfileState? profileState;
  late AuthenticationService _authService;

  @override
  void initState() {
    verifyRoute(requireAuth: true, requireRole: UserRole.CUSTOMER);
    profileState = UpdateProfileState();
    _authService = locator.get();
    super.initState();
  }

  @override
  void dispose() {
    profileState = null;
    super.dispose();
  }

  @override
  void onBtnUpdateProfileClicked(UserModel user) => _updateProfile(user);

  Future<void> _updateProfile(UserModel user) async {
    UsersRestApi _usersClient = locator.get();
    ApplicationState appState = context.read();
    Debug.log('update profile', user);
    var result = await _usersClient.updateUser(user).Value();

    if (result.failureType == FAILURE_TYPE.NONE) {
      final result = await _authService.refreshAccessToken();

      if (result.failureType == FAILURE_TYPE.NONE) {
        await appState.refresh();
        context.toastSuccess('Cập nhật profile thành công');
      }

      return;
    }

    context.toastError('Cập nhật profile thất bại');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: ((context) => profileState!))],
      child: super.build(context),
    );
  }
}
