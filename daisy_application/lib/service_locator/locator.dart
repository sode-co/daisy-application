import 'package:daisy_application/service_locator/core_services_locator.dart';
import 'package:daisy_application/service_locator/domain_services_locator.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupDependencies() async {
  DomainServicesLocator.init();
  await CoreServiceLocator.init();
}
