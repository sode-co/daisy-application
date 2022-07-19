///
//  Generated code. Do not modify.
//  source: discussion_services.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'discussion_services.pb.dart' as $0;
export 'discussion_services.pb.dart';

class DiscussionServiceClient extends $grpc.Client {
  static final _$fetchDiscussions = $grpc.ClientMethod<
          $0.FetchDiscussionRequestModel, $0.FetchDiscussionResponseModel>(
      '/daisy.DiscussionService/FetchDiscussions',
      ($0.FetchDiscussionRequestModel value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.FetchDiscussionResponseModel.fromBuffer(value));

  DiscussionServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.FetchDiscussionResponseModel> fetchDiscussions(
      $0.FetchDiscussionRequestModel request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$fetchDiscussions, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class DiscussionServiceBase extends $grpc.Service {
  $core.String get $name => 'daisy.DiscussionService';

  DiscussionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FetchDiscussionRequestModel,
            $0.FetchDiscussionResponseModel>(
        'FetchDiscussions',
        fetchDiscussions_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.FetchDiscussionRequestModel.fromBuffer(value),
        ($0.FetchDiscussionResponseModel value) => value.writeToBuffer()));
  }

  $async.Stream<$0.FetchDiscussionResponseModel> fetchDiscussions_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.FetchDiscussionRequestModel> request) async* {
    yield* fetchDiscussions(call, await request);
  }

  $async.Stream<$0.FetchDiscussionResponseModel> fetchDiscussions(
      $grpc.ServiceCall call, $0.FetchDiscussionRequestModel request);
}
