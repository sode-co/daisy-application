import 'package:grpc/grpc_connection_interface.dart';
import 'package:grpc/grpc_web.dart';
import '../common/config.dart';
import 'locator.dart';

class UniversalLocator {
  static init() {
    _initGrpcService();
  }

  static void _initGrpcService() {
    locator.registerFactory<ClientChannelBase>(
        () => GrpcWebClientChannel.xhr(Uri.parse(Config.GRPC_URL)));
  }
}
