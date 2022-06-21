import 'package:daisy_application/domain-services/authentication-service.dart';
import 'package:daisy_application/domain-services/category_service.dart';
import 'package:daisy_application/service_locator/locator.dart';

class DomainServicesLocator {
  static void init() {
    locator.registerFactory(() => AuthenticationService(locator.get(),
        locator.get(), locator.get(), locator.get(), locator.get()));
    locator.registerFactory(() => CategoryService(locator.get()));
  }
}
