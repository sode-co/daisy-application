import 'package:daisy_application/schema/file_transfer.pbgrpc.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:fixnum/fixnum.dart' as $fixum;

class ResourceGrpcClient {
  Stream<ResourceStreamingResponseModel> streamingResource(
      String workStatus, int workspaceId, int timeOffset) {
    ClientChannelBase channel = locator.get();
    StreamingResourceClient client = StreamingResourceClient(channel);
    return client.streaming(ResoureStreamingRequestModel(
        workStatus: workStatus,
        workspaceId: workspaceId,
        timeOffset: $fixum.Int64.parseInt(timeOffset.toString()),
        count: 50,
        rate: 5));
  }
}
