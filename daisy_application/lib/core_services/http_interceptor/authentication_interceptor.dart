import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/http/authentication/authentication_rest_api.dart';
import 'package:daisy_application/core_services/models/authentication/authentication_model.dart';
import 'package:daisy_application/core_services/persistent/authentication_persistent.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:dio/dio.dart';

class AuthenticationInterceptor extends InterceptorsWrapper {
  AuthenticationInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    const ns = 'authentication-interceptor';
    Debug.log(ns, 'fetching access token');

    if (options.headers.containsKey('Authorization')) {
      handler.next(options);
      return;
    }

    AuthenticationPersistent authServices = locator.get();
    AuthenticationModel? _auth = await authServices.getCurrentAuth();
    if (_auth == null) {
      handler.next(options);
      return;
    }

    AuthenticationModel auth = _auth;
    if (auth.refreshToken == '' || auth.isRefreshTokenExpired()) {
      handler.next(options);
      return;
    }

    if (auth.accessToken == '' || auth.isAccessTokenExpired()) {
      AuthenticationRestApi authClient = locator.get();
      var result = await authClient
          .generateAccessToken('Bearer ${auth.refreshToken}')
          .Value();
      if (result.failureType != FAILURE_TYPE.NONE) {
        handler.next(options);
        return;
      }

      auth.accessToken = result.data.accessToken;
      await authServices.setAuth(auth);
    }
    Debug.log(ns, 'Found access token', auth.accessToken);
    options.headers['Authorization'] ??= 'bearer ${auth.accessToken}';
    handler.next(options);
  }
}
