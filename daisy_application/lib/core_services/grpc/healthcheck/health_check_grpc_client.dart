import 'package:daisy_application/service_locator/locator.dart';
import 'package:grpc/grpc_connection_interface.dart';
import '../../../schema/healthcheck.pbgrpc.dart';

class HealthCheckGrpcClient {
  HealthCheckGrpcClient();

  Future<bool> performNetworkCheck() async {
    final ClientChannelBase channel = locator.get();

    final client = HealthCheckServiceClient(channel);
    final request = HealthCheckRequest();
    final result = await client.check(request);
    await channel.shutdown();
    return result.message == 'Ok';
  }
}
