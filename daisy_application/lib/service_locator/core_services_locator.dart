import 'package:daisy_application/core_services/grpc/healthcheck/HealthCheckGrpcService.dart';
import 'package:daisy_application/core_services/http/health_check/health_check_rest_api.dart';
import 'package:dio/dio.dart';
import 'package:grpc/grpc.dart';

import '../common/config.dart';
import 'locator.dart';

class CoreServiceLocator {
  static init() {
    _initGrpcService();
    _initHttpService();
  }

  static void _initGrpcService() {
    locator.registerFactory(() => ClientChannel(Config.GRPC_HOST,
        port: Config.GRPC_PORT,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure())));

    locator.registerFactory<HealthCheckGrpcService>(
        () => HealthCheckGrpcService(locator.get()));
  }

  static void _initHttpService() {
    locator.registerFactory(() => Dio());

    locator.registerFactory<HealthCheckRestApi>(() => HealthCheckRestApi(
        locator.get(),
        baseUrl: '${Config.API_URL}/v1/healthcheck'));
  }
}
