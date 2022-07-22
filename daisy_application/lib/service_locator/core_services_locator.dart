import 'package:daisy_application/core_services/google/google_sign_in.dart';
import 'package:daisy_application/core_services/grpc/discussions/discussions_grpc_client.dart';
import 'package:daisy_application/core_services/grpc/healthcheck/health_check_grpc_client.dart';
import 'package:daisy_application/core_services/grpc/request/request_grpc_client.dart';
import 'package:daisy_application/core_services/http/artwork/artwork_rest_api.dart';
import 'package:daisy_application/core_services/http/authentication/authentication_rest_api.dart';
import 'package:daisy_application/core_services/http/category/category_rest_api.dart';
import 'package:daisy_application/core_services/http/health_check/health_check_rest_api.dart';
import 'package:daisy_application/core_services/http/job_application/job_application_rest_api.dart';
import 'package:daisy_application/core_services/http/portfolio/portfolio_rest_api.dart';
import 'package:daisy_application/core_services/http/project/project_rest_api.dart';
import 'package:daisy_application/core_services/http/request/request_rest_api.dart';
import 'package:daisy_application/core_services/http/user/user_rest_api.dart';
import 'package:daisy_application/core_services/http/users/users_rest_api.dart';
import 'package:daisy_application/core_services/http_interceptor/authentication_interceptor.dart';
import 'package:daisy_application/core_services/models/authentication/authentication_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/core_services/persistent/authentication_persistent.dart';
import 'package:daisy_application/core_services/persistent/user_persistent.dart';
import 'package:daisy_application/core_services/socket/discussions/discussion_signalr_client.dart';
import 'package:daisy_application/core_services/socket/file_upload/file_upload_socket_client.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:signalr_netcore/http_connection_options.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';
import 'package:signalr_netcore/web_supporting_http_client.dart';
// ignore: library_prefixes
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../common/config.dart';
import 'locator.dart';
import 'native_locator.dart' if (dart.library.html) 'web_locator.dart'
    as universal_locator;

class CoreServiceLocator {
  static Future<void> init() async {
    _initGrpcService();
    _initSocketService();
    _initHttpService();
    await _initPersistentService();
    _initGoogleService();
    _initSignalRServices();
  }

  static void _initGrpcService() {
    universal_locator.UniversalLocator.init();
    locator
        .registerFactory<HealthCheckGrpcClient>(() => HealthCheckGrpcClient());
    locator.registerFactory<RequestGrpcClient>(() => RequestGrpcClient());
    locator
        .registerFactory<DiscussionsGrpcClient>(() => DiscussionsGrpcClient());
  }

  static void _initSignalRServices() {
    final httpConnectionOptions = HttpConnectionOptions(
        httpClient:
            WebSupportingHttpClient(null, httpClientCreateCallback: null),
        logMessageContent: true);

    locator.registerFactory<HubConnection>(() => HubConnectionBuilder()
        .withUrl('${Config.API_URL}/discussion', options: httpConnectionOptions)
        .withAutomaticReconnect(
            retryDelays: [2000, 5000, 10000, 20000]).build());

    locator.registerFactory<DiscussionSignalRClient>(
        () => DiscussionSignalRClient(locator.get()));
  }

  static void _initSocketService() {
    locator.registerFactoryParam<IO.Socket, String, String>(
        (param1, param2) => IO.io(
            param1,
            IO.OptionBuilder()
                .setTransports(['websocket']) // for Flutter or Dart VM
                .disableAutoConnect() // disable auto-connection
                .setPath(param2)
                .build()));

    locator.registerFactory(() => FileUploadSocketClient());
  }

  static void _initHttpService() {
    locator.registerFactory<Dio>(
        () => Dio()..interceptors.add(AuthenticationInterceptor()));

    locator.registerFactory<HealthCheckRestApi>(() => HealthCheckRestApi(
        locator.get(),
        baseUrl: '${Config.API_URL}/v1/healthcheck'));

    locator.registerFactory<AuthenticationRestApi>(() => AuthenticationRestApi(
        locator.get(),
        baseUrl: '${Config.API_URL}/v1/auth'));

    locator.registerFactory<UserRestApi>(
        () => UserRestApi(locator.get(), baseUrl: '${Config.API_URL}/v1/user'));

    locator.registerFactory<UsersRestApi>(() =>
        UsersRestApi(locator.get(), baseUrl: '${Config.API_URL}/v1/users'));

    locator.registerFactory<CategoryRestApi>(
        () => CategoryRestApi(locator.get(), baseUrl: Config.API_URL));

    locator.registerFactory<RequestRestApi>(() => RequestRestApi(locator.get(),
        baseUrl: '${Config.API_URL}/v1/requests'));

    locator.registerFactory<JobApplicationRestApi>(() => JobApplicationRestApi(
        locator.get(),
        baseUrl: '${Config.API_URL}/v1/application'));

    locator.registerFactory<ProjectRestApi>(() =>
        ProjectRestApi(locator.get(), baseUrl: '${Config.API_URL}/v1/project'));

    locator.registerFactory<PortfolioRestApi>(() => PortfolioRestApi(
        locator.get(),
        baseUrl: '${Config.API_URL}/v1/portfolios'));

    locator.registerFactory<ArtworkRestApi>(() => ArtworkRestApi(locator.get(),
        baseUrl: '${Config.API_URL}/v1/artworks'));
  }

  static Future<void> _initPersistentService() async {
    Hive.registerAdapter<AuthenticationModel>(AuthenticationAdapter());
    locator.registerFactory(() => AuthenticationPersistent());
    await Hive.openBox(AuthenticationPersistent.BOX_NAME);

    Hive.registerAdapter<UserModel>(UserAdapter());
    locator.registerFactory(() => UserPersistent());
    await Hive.openBox(UserPersistent.BOX_NAME);
  }

  static void _initGoogleService() {
    locator.registerFactory<GoogleSignIn>(() => GoogleSignIn());
  }
}
