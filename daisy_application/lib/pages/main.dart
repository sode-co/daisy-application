import 'package:daisy_application/common/config.dart';
import 'package:daisy_application/core_services/http/health_check/health_check_rest_api.dart';
import 'package:daisy_application/core_services/models/health_check_response_model.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/dio.dart';
import '../common/Debug/logger.dart';
import '../service_locator/locator.dart';
import 'dart:async';

void main() {
  setupDependencies();
  String ns = 'network-healthcheck';
  Timer.periodic(const Duration(seconds: 10), (Timer t) async {
    HealthCheckRestApi healthCheckApi = locator.get();
    Response response = (await healthCheckApi.get()).response;
    if (response.statusCode != 200) {
      Error.log(ns, 'Failed when perform network check with status',
          response.statusCode);
    } else {
      Debug.log(ns, 'Network check with result', response.data);
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
        child: Text(Config.API_HOST + "tie"),
      ),
    );
  }
}
