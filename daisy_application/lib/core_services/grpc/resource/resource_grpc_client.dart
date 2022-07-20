import 'package:daisy_application/core_services/models/resource/resource_model.dart';
import 'package:daisy_application/schema/file_transfer.pbgrpc.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:fixnum/fixnum.dart' as $fixum;

class ResourceGrpcClient {
  Stream<ResourceModel> streamingResource(
      String workStatus, int workspaceId, int timeOffset) async* {
    ClientChannelBase channel = locator.get();
    ResourceServiceClient client = ResourceServiceClient(channel);
    await for (var response in client.streamingResourceModel(
        StreamingResourceModelRequestModel(
            workStatus: workStatus,
            workspaceId: workspaceId,
            timeOffset: $fixum.Int64.parseInt(timeOffset.toString()),
            count: 50,
            rate: 5))) {
      for (var res in response.resources) {
        yield ResourceModel.fromProto(res);
      }
    }
  }
}
