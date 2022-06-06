import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/http/authentication/authentication_rest_api.dart';
import 'package:daisy_application/core_services/persistent/authentication_persistent.dart';
import 'package:dio/dio.dart';
import '../common/Debuger/logger.dart';
import '../core_services/models/authentication/authentication_model.dart';
import '../service_locator/locator.dart';

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
      handler.reject(DioError(requestOptions: options));
      return;
    }

    AuthenticationModel auth = _auth;
    if (auth.refreshToken == '' || auth.isRefreshTokenExpired()) {
      handler.reject(DioError(requestOptions: options));
      return;
    }

    if (auth.accessToken == '' || auth.isAccessTokenExpired() || true) {
      AuthenticationRestApi authClient = locator.get();
      var result = await authClient
          .generateAccessToken('Bearer ${auth.refreshToken}')
          .Value();
      if (result.failureType != FAILURE_TYPE.NONE) {
        handler.reject(DioError(requestOptions: options));
        return;
      }

      auth.accessToken = result.data.accessToken;
      await authServices.setAuth(auth);
    }

    Debug.log(ns, 'current authorization', auth);
    options.headers['Authorization'] ??= auth.accessToken;
  }
}
