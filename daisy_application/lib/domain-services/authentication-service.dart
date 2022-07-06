import 'package:daisy_application/common/constants.dart'; // ignore: file_names
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/google/google_sign_in.dart';
import 'package:daisy_application/core_services/http/authentication/authentication_rest_api.dart';
import 'package:daisy_application/core_services/http/user/user_rest_api.dart';
import 'package:daisy_application/core_services/models/authentication/authentication_model.dart';
import 'package:daisy_application/core_services/persistent/authentication_persistent.dart';
import 'package:daisy_application/core_services/persistent/user_persistent.dart';

class AuthenticationService {
  // ignore: unused_field
  final GoogleSignIn _googleSignIn;
  final AuthenticationRestApi _authRestClient;
  final AuthenticationPersistent _authenticationPersistent;
  final UserPersistent _userPersistent;
  final UserRestApi _userClient;

  AuthenticationService(this._googleSignIn, this._authRestClient,
      this._userClient, this._authenticationPersistent, this._userPersistent);

  Future<Result> signUp(UserRole selectedRole) async {
    final googleIdToken = await _googleSignIn.signIn();
    final result = await (_authRestClient
        .signUp('Bearer $googleIdToken', {'role': selectedRole.name}).Value());
    if (result.failureType == FAILURE_TYPE.NONE) {
      await _saveUserDataAndAuthenticationIntoLocal(result.data);
    }

    return result;
  }

  Future<Result> signIn() async {
    final googleIdToken = await _googleSignIn.signIn();
    final result =
        await (_authRestClient.signin('Bearer $googleIdToken').Value());
    if (result.failureType == FAILURE_TYPE.NONE) {
      Debug.log('signin', 'success save result');
      await _saveUserDataAndAuthenticationIntoLocal(result.data);
    }

    return result;
  }

  Future<void> signOut() async {
    await _userPersistent.remove();
    await _authenticationPersistent.removeAuth();
  }

  Future<Result> _saveUserDataAndAuthenticationIntoLocal(
      AuthenticationModel auth) async {
    await _authenticationPersistent.setAuth(auth);
    final result = await _userClient.getCurrentUser().Value();

    if (result.failureType == FAILURE_TYPE.NONE) {
      await _userPersistent.set(result.data);
    }

    return result;
  }

  Future<Result> refreshAccessToken() async {
    AuthenticationModel? auth =
        await _authenticationPersistent.getCurrentAuth();

    var result = await _authRestClient
        .generateAccessToken('Bearer ${auth!.refreshToken}')
        .Value();

    Debug.log('tiendang-debug', 'refresh access token', result.data);
    if (result.failureType != FAILURE_TYPE.NONE) return result;

    auth.accessToken = result.data.accessToken;

    return await _saveUserDataAndAuthenticationIntoLocal(auth);
  }
}
