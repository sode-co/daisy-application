///
//  Generated code. Do not modify.
//  source: request_services.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'request_services.pb.dart' as $0;
export 'request_services.pb.dart';

class RequestServiceClient extends $grpc.Client {
  static final _$createRequestStreaming = $grpc.ClientMethod<
          $0.CreateRequestStreamingRequestModel,
          $0.CreateRequestStreamingResponseModel>(
      '/daisy.RequestService/CreateRequestStreaming',
      ($0.CreateRequestStreamingRequestModel value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CreateRequestStreamingResponseModel.fromBuffer(value));

  RequestServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.CreateRequestStreamingResponseModel>
      createRequestStreaming($0.CreateRequestStreamingRequestModel request,
          {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$createRequestStreaming, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class RequestServiceBase extends $grpc.Service {
  $core.String get $name => 'daisy.RequestService';

  RequestServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateRequestStreamingRequestModel,
            $0.CreateRequestStreamingResponseModel>(
        'CreateRequestStreaming',
        createRequestStreaming_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.CreateRequestStreamingRequestModel.fromBuffer(value),
        ($0.CreateRequestStreamingResponseModel value) =>
            value.writeToBuffer()));
  }

  $async.Stream<$0.CreateRequestStreamingResponseModel>
      createRequestStreaming_Pre($grpc.ServiceCall call,
          $async.Future<$0.CreateRequestStreamingRequestModel> request) async* {
    yield* createRequestStreaming(call, await request);
  }

  $async.Stream<$0.CreateRequestStreamingResponseModel> createRequestStreaming(
      $grpc.ServiceCall call, $0.CreateRequestStreamingRequestModel request);
}
