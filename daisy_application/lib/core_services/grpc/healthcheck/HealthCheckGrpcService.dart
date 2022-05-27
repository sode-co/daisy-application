// ignore: file_names
import 'package:grpc/grpc.dart';
import '../../../schema/healthcheck.pbgrpc.dart';

class HealthCheckGrpcService {
  final ClientChannel _channel;

  HealthCheckGrpcService(this._channel);

  Future<bool> performNetworkCheck() async {
    final client = HealthCheckServiceClient(_channel);
    final request = HealthCheckRequest();
    final result = await client.check(request);
    await _channel.shutdown();
    return result.message == 'Ok';
  }
}
