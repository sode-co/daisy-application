import 'dart:async';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/Debuger/logger.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/platform_helper.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/google/firebase_options.dart';
import 'package:daisy_application/core_services/grpc/healthcheck/health_check_grpc_client.dart';
import 'package:daisy_application/core_services/http/health_check/health_check_rest_api.dart';
import 'package:daisy_application/pages/discovery-page/discovery.dart';
import 'package:daisy_application/pages/landing-page/view/landing.dart';
import 'package:daisy_application/pages/signup-page/view/signup.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!PlatformHelper.isPlatform(PLATFORM.Web)) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  setupDependencies();
  // Debug.log('init-client', 'Client start healthcheck');
  String ns = 'network-healthcheck';
  Timer.periodic(const Duration(seconds: 3), (Timer t) async {
    HealthCheckGrpcClient client = locator.get();
    final result = await client.performNetworkCheck();
    if (result.failureType == FAILURE_TYPE.NONE) {
      // Debug.log('$ns-grpc', 'Grpc connection ok');
    } else {
      // Error.log('$ns-grpc', 'Grpc connection error');
    }

    HealthCheckRestApi healthCheckApi = locator.get();
    final response = (await healthCheckApi.get().Value());
    if (response.failureType != FAILURE_TYPE.NONE) {
      Error.log('$ns-http', 'Failed when perform network check with status',
          response.failureType.name);
    } else {
      final data = response.data;
      // Debug.log('$ns-http', 'Network check with result', data.message);
    }
  });

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => ApplicationState())],
      child: MaterialApp(
        title: 'Daisy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/categories': (context) => const DiscoveryPage(),
          '/signup': (context) => const SignUp(),
        },
        home: const LandingPage(),
      ),
    );
  }
}
