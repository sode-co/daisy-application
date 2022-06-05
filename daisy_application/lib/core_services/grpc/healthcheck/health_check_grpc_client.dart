import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:grpc/grpc_connection_interface.dart';
import '../../../schema/healthcheck.pbgrpc.dart';

class HealthCheckGrpcClient {
  HealthCheckGrpcClient();

  Future<Result<bool>> performNetworkCheck() async {
    final ClientChannelBase channel = locator.get();

    final client = HealthCheckServiceClient(channel);
    final request = HealthCheckRequest();
    final result = await client.check(request);
    await channel.shutdown();
    if (result.message != 'Ok') {
      return Result(data: false, failureType: FAILURE_TYPE.NETWORK_ERROR);
    }

    return Result(data: true);
  }
}
