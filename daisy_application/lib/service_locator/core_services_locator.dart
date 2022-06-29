import 'package:daisy_application/core_services/google/google_sign_in.dart';
import 'package:daisy_application/core_services/grpc/healthcheck/health_check_grpc_client.dart';
import 'package:daisy_application/core_services/grpc/request/request_grpc_client.dart';
import 'package:daisy_application/core_services/http/authentication/authentication_rest_api.dart';
import 'package:daisy_application/core_services/http/category/category_rest_api.dart';
import 'package:daisy_application/core_services/http/health_check/health_check_rest_api.dart';
import 'package:daisy_application/core_services/http/job_application/job_application_rest_api.dart';
import 'package:daisy_application/core_services/http/request/request_rest_api.dart';
import 'package:daisy_application/core_services/http/user/user_rest_api.dart';
import 'package:daisy_application/core_services/http_interceptor/authentication_interceptor.dart';
import 'package:daisy_application/core_services/models/authentication/authentication_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/core_services/persistent/authentication_persistent.dart';
import 'package:daisy_application/core_services/persistent/user_persistent.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../common/config.dart';
import 'locator.dart';
import 'native_locator.dart' if (dart.library.html) 'web_locator.dart'
    as universal_locator;

class CoreServiceLocator {
  static Future<void> init() async {
    _initGrpcService();
    _initHttpService();
    await _initPersistentService();
    _initGoogleService();
  }

  static void _initGrpcService() {
    universal_locator.UniversalLocator.init();
    locator
        .registerFactory<HealthCheckGrpcClient>(() => HealthCheckGrpcClient());
    locator.registerFactory<RequestGrpcClient>(() => RequestGrpcClient());
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

    locator.registerFactory<UserRestApi>(
        () => UserRestApi(locator.get(), baseUrl: '${Config.API_URL}/v1/user'));

    locator.registerFactory<CategoryRestApi>(
        () => CategoryRestApi(locator.get(), baseUrl: Config.API_URL));

    locator.registerFactory<RequestRestApi>(() => RequestRestApi(locator.get(),
        baseUrl: '${Config.API_URL}/v1/requests'));

    locator.registerFactory<JobApplicationRestApi>(() => JobApplicationRestApi(
        locator.get(),
        baseUrl: '${Config.API_URL}/v1/application'));
  }

  static Future<void> _initPersistentService() async {
    Hive.registerAdapter<AuthenticationModel>(AuthenticationAdapter());
    locator.registerFactory(() => AuthenticationPersistent());
    await Hive.openBox(AuthenticationPersistent.BOX_NAME);

    Hive.registerAdapter<UserModel>(UserAdapter());
    locator.registerFactory(() => UserPersistent());
    await Hive.openBox(UserPersistent.BOX_NAME);
  }

  static void _initGoogleService() {
    locator.registerFactory<GoogleSignIn>(() => GoogleSignIn());
  }
}
