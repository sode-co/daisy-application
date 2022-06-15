import 'dart:async';
import 'package:daisy_application/pages/common/image_picker/native_image_picker.dart'
    if (dart.library.html) 'package:daisy_application/pages/common/image_picker/web_image_picker.dart'
    as image_picker;
import 'dart:typed_data';
import 'package:daisy_application/app_state/application_state.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/common/platform_helper.dart';
import 'package:daisy_application/core_services/google/firebase_options.dart';
import 'package:daisy_application/core_services/grpc/file_transfer/file_upload_grpc_client_native.dart';
import 'package:daisy_application/pages/discovery-page/discovery.dart';
import 'package:daisy_application/pages/signup-page/view/signup.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../core_services/common/response_handler.dart';
import '../core_services/grpc/healthcheck/health_check_grpc_client.dart';
import '../core_services/socket/file_upload/file_upload_socket_client.dart';

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
  Timer.periodic(const Duration(seconds: 2), (Timer t) async {
    // HealthCheckGrpcClient client = locator.get();
    // final result = await client.performNetworkCheck();
    // if (result.failureType == FAILURE_TYPE.NONE) {
    //   Debug.log('$ns-grpc', 'Grpc connection ok');
    // } else {
    //   Error.log('$ns-grpc', 'Grpc connection error');
    // }

    // HealthCheckRestApi healthCheckApi = locator.get();
    // final response = (await healthCheckApi.get().Value());
    // if (response.failureType != FAILURE_TYPE.NONE) {
    //   Error.log('$ns-http', 'Failed when perform network check with status',
    //       response.failureType.name);
    // } else {
    //   final data = response.data;
    //   Debug.log('$ns-http', 'Network check with result', data.message);
    // }
  });

  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  Future _pickImage() async {
    try {
      Uint8List? bytes =
          await image_picker.UniversalImagePicker.getImageAsByte();
      if (bytes == null) return;

      Debug.log('found bytes', bytes);
      await FileUploadSocketClient().performUpload(bytes,
          (double progress, FAILURE_TYPE failed) {
        Debug.log('upload-file-call-back', 'uploaded progress', progress,
            'with failure type', failed);
      });
    } on PlatformException catch (e) {
      Debug.log(
          'File picker', 'An error occurs while picking image', e.message);
    }
  }

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
        home: MaterialButton(
            child: const Text(
              'Upload',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: (() async {
              await _pickImage();
            })),
      ),
    );
  }
}
