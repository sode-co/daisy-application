import 'package:daisy_application/common/config.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'locator.dart';

class UniversalLocator {
  static init() {
    _initGrpcService();
  }

  static void _initGrpcService() {
    locator.registerFactory<ClientChannelBase>(() => ClientChannel(
        Config.GRPC_HOST,
        port: Config.GRPC_MOBILE_PORT,
        options:
            const ChannelOptions(credentials: ChannelCredentials.insecure())));
  }
}
