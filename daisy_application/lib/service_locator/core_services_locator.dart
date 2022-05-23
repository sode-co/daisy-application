import 'package:daisy_application/core_services/http/health_check/health_check_rest_api.dart';
import 'package:dio/dio.dart';

import 'locator.dart';

class CoreServiceLocator {
  static init() {
    _initCoreService();
  }

  static void _initCoreService() {
    locator.registerFactory(() => Dio());
    locator.registerFactory<HealthCheckRestApi>(
        () => HealthCheckRestApi(locator.get()));
  }
}
