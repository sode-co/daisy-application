import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/google/google_sign_in.dart';
import 'package:daisy_application/core_services/http/authentication/authentication_rest_api.dart';
import 'package:daisy_application/pages/signup-page/listener/sign_up_page_listener.dart';
import 'package:daisy_application/pages/signup-page/model/sign_up_page_state.dart';

import '../../../common/Debuger/logger.dart';
import '../../../core_services/models/authentication/authentication_model.dart';
import '../../../core_services/persistent/authentication_persistent.dart';

class SignUpPageController implements SignUpPageListener {
  final SignUpPageState _signUpPageState;
  final GoogleSignIn _googleSignIn;
  final AuthenticationRestApi _authRestClient;
  final AuthenticationPersistent _authService;

  SignUpPageController(this._signUpPageState, this._googleSignIn,
      this._authRestClient, this._authService);

  @override
  void onBtnSignupClicked(UserRole selectedRole) {
    Future<void>.sync(() async {
      const ns = 'signup-with-google';
      Debug.log(ns, 'signing in');

      final googleIdToken = await _googleSignIn.signIn();

      final result = await _authRestClient
          .signUp('Bearer $googleIdToken', {'role': selectedRole.name}).Value();
      Debug.log('Receive result', result);
      if (result.failureType == FAILURE_TYPE.NONE) {
        AuthenticationModel auth = result.data;
        _authService.setAuth(auth);
        Debug.log(ns, 'success with server response', auth.accessToken);
      }
    });
  }
}
