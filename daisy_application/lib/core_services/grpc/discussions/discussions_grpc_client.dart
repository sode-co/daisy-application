import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/models/discussion/discussion_model.dart';
import 'package:daisy_application/schema/discussion_services.pbgrpc.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:fixnum/fixnum.dart' as $fixum;

class DiscussionsGrpcClient {
  Stream<Result<List<DiscussionModel>>> fetchingDiscussions(String workspaceId,
      {required int timeOffset, int? count, int? rate}) async* {
    ClientChannelBase channel = locator.get();
    final client = DiscussionServiceClient(channel);

    await for (var res in client.fetchDiscussions(FetchDiscussionRequestModel()
      ..timeOffset = $fixum.Int64.parseInt(timeOffset.toString())
      ..count = count ?? 40
      ..rate = rate ?? 5)) {
      yield Result(
          data: res.discussions
              .map((resItem) => DiscussionModel.fromProto(resItem))
              .toList());
    }
  }
}
