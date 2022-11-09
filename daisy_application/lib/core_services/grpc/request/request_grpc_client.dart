import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/schema/request_services.pbgrpc.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:fixnum/fixnum.dart' as $fixum;

typedef _RequestModel = CreateRequestStreamingRequestModel;

class RequestGrpcClient {
  Stream<Result<List<RequestModel>>> startStreamingRequests(
      {required int timeOffset, int? count, int? rate}) async* {
    final ClientChannelBase channel = locator.get();
    final client = RequestServiceClient(channel);

    await for (var response in client.createRequestStreaming(_RequestModel()
      ..timeOffset = $fixum.Int64.parseInt(timeOffset.toString())
      ..count = count ?? 20
      ..rate = rate ?? 1)) {
      yield Result(
          data: response.requests
              .map((item) => RequestModel.fromProto(item))
              .toList(),
          failureType: FAILURE_TYPE.NONE);
    }
  }
}
