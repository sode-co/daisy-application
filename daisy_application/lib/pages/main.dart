import 'package:daisy_application/core_services/grpc/healthcheck/health_check_grpc_client.dart';
import 'package:daisy_application/core_services/http/health_check/health_check_rest_api.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../common/debuger/logger.dart';
import '../service_locator/locator.dart';
import 'dart:async';

void main() {
  Debug.log('hello');
  setupDependencies();
  String ns = 'network-healthcheck';
  Timer.periodic(const Duration(seconds: 10), (Timer t) async {
    HealthCheckGrpcClient client = locator.get();
    if (await client.performNetworkCheck()) {
      Debug.log('$ns-grpc', 'Grpc connection ok');
    } else {
      Error.log('$ns-grpc', 'Grpc connection error');
    }

    HealthCheckRestApi healthCheckApi = locator.get();
    Response response = (await healthCheckApi.get()).response;
    if (response.statusCode != 200) {
      Error.log('$ns-http', 'Failed when perform network check with status',
          response.statusCode);
    } else {
      Debug.log('$ns-http', 'Network check with result', response.data);
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) {
    Debug.log('Init client');
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daisy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        color: Colors.white,
        child: Container(),
      ),
    );
  }
}
