import '../../../schema/healthcheck.pbgrpc.dart';
import 'package:grpc/grpc.dart';

class HealthCheckGrpcClient {
  final ClientChannel _channel;

  HealthCheckGrpcClient(this._channel);

  Future<bool> performNetworkCheck() async {
    final client = HealthCheckServiceClient(_channel);
    final request = HealthCheckRequest();
    final result = await client.check(request);
    await _channel.shutdown();
    return result.message == 'Ok';
  }
}
