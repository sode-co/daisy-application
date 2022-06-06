import 'package:daisy_application/common/debuger/logger.dart';
import 'package:daisy_application/core_services/http/authentication/authentication_rest_api.dart';
import 'package:daisy_application/core_services/models/authentication/authentication_model.dart';
import 'package:daisy_application/core_services/persistent/authentication_persistent.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in/google_sign_in.dart' as signin_services;

class GoogleSignIn {
  final _service = signin_services.GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/user.phonenumbers.read',
        'https://www.googleapis.com/auth/userinfo.profile'
      ],
      clientId:
          '947734464395-hb4v5ckgh3vfbaskfm0hcv1kf451i3ef.apps.googleusercontent.com');
  GoogleSignInAccount? _account;

  GoogleSignInAccount? get account => _account;

  Future<String> signIn() async {
    try {
      _account = await _service.signIn();
    } catch (ex) {
      Debug.log('google-signin', 'Failed to signin with google with error', ex,
          'Skipping...');
    }
    if (_account == null) return '';

    final googleAuth = await _account!.authentication;
    Debug.log('google-signin', 'success with accessToken', googleAuth.idToken);
    return googleAuth.idToken ?? '';
  }
}
