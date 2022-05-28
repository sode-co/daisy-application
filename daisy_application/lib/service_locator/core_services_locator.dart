import 'package:daisy_application/core_services/grpc/healthcheck/health_check_grpc_client.dart';
import 'package:daisy_application/core_services/http/health_check/health_check_rest_api.dart';
import 'package:dio/dio.dart';
import '../common/config.dart';
import 'locator.dart';
import 'native_locator.dart' if (dart.library.html) 'web_locator.dart'
    as universal_locator;

class CoreServiceLocator {
  static init() {
    _initGrpcService();
    _initHttpService();
  }

  static void _initGrpcService() {
    universal_locator.UniversalLocator.init();
    locator
        .registerFactory<HealthCheckGrpcClient>(() => HealthCheckGrpcClient());
  }

  static void _initHttpService() {
    locator.registerFactory(() => Dio());

    locator.registerFactory<HealthCheckRestApi>(() => HealthCheckRestApi(
        locator.get(),
        baseUrl: '${Config.API_URL}/v1/healthcheck'));
  }
}
