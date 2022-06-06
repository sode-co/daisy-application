import 'package:daisy_application/core_services/google/google_sign_in.dart';
import 'package:daisy_application/core_services/grpc/healthcheck/health_check_grpc_client.dart';
import 'package:daisy_application/core_services/http/authentication/authentication_rest_api.dart';
import 'package:daisy_application/core_services/http/health_check/health_check_rest_api.dart';
import 'package:daisy_application/core_services/persistent/authentication_persistent.dart';
import 'package:daisy_application/http_interceptor/authentication_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../common/config.dart';
import 'locator.dart';
import 'native_locator.dart' if (dart.library.html) 'web_locator.dart'
    as universal_locator;

class CoreServiceLocator {
  static init() {
    _initGrpcService();
    _initHttpService();
    _initPersistentService();
    _initGoogleService();
  }

  static void _initGrpcService() {
    universal_locator.UniversalLocator.init();
    locator
        .registerFactory<HealthCheckGrpcClient>(() => HealthCheckGrpcClient());
  }

  static void _initHttpService() {
    locator.registerFactory<Dio>(
        () => Dio()..interceptors.add(AuthenticationInterceptor()));

    locator.registerFactory<HealthCheckRestApi>(() => HealthCheckRestApi(
        locator.get(),
        baseUrl: '${Config.API_URL}/v1/healthcheck'));

    locator.registerFactory<AuthenticationRestApi>(() => AuthenticationRestApi(
        locator.get(),
        baseUrl: '${Config.API_URL}/v1/auth'));
  }

  static void _initPersistentService() {
    Hive.registerAdapter(AuthenticationAdapter());
    locator.registerFactory(() => AuthenticationPersistent());
  }

  static void _initGoogleService() {
    locator.registerFactory<GoogleSignIn>(() => GoogleSignIn());
  }
}
