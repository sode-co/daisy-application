import 'dart:async';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/google/google_sign_in.dart';
import 'package:daisy_application/core_services/grpc/healthcheck/health_check_grpc_client.dart';
import 'package:daisy_application/core_services/http/health_check/health_check_rest_api.dart';
import 'package:daisy_application/core_services/models/health_check_response_model.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../common/debuger/logger.dart';
import '../common/platform_helper.dart';
import '../service_locator/locator.dart';
import '../core_services/google/firebase_options.dart';
import '../core_services/common/response_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!PlatformHelper.isPlatform(PLATFORM.Web)) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  setupDependencies();
  Debug.log('init-client', 'Client start healthcheck');
  String ns = 'network-healthcheck';
  Timer.periodic(const Duration(seconds: 30), (Timer t) async {
    HealthCheckGrpcClient client = locator.get();
    final result = await client.performNetworkCheck();
    if (result.failureType == FAILURE_TYPE.NONE) {
      Debug.log('$ns-grpc', 'Grpc connection ok');
    } else {
      Error.log('$ns-grpc', 'Grpc connection error');
    }

    HealthCheckRestApi healthCheckApi = locator.get();
    final response = (await healthCheckApi.get());
    if (response.FailureType() != FAILURE_TYPE.NONE) {
      Error.log('$ns-http', 'Failed when perform network check with status',
          response.FailureType().name);
    } else {
      final data = response.Data(HealthCheckResponseModel.fromJson);
      Debug.log('$ns-http', 'Network check with result', data.message);
    }
  });

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoogleSignIn _signInService = locator.get();
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daisy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/categories': (context) => const DiscoveryPage(),
      },
      home: LandingPage(),
    );
  }
}
