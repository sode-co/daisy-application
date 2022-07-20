///
//  Generated code. Do not modify.
//  source: file_transfer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'file_transfer.pb.dart' as $0;
export 'file_transfer.pb.dart';

class StreamingResourceClient extends $grpc.Client {
  static final _$streaming = $grpc.ClientMethod<$0.ResoureStreamingRequestModel,
          $0.ResourceStreamingResponseModel>(
      '/daisy.StreamingResource/Streaming',
      ($0.ResoureStreamingRequestModel value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ResourceStreamingResponseModel.fromBuffer(value));

  StreamingResourceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.ResourceStreamingResponseModel> streaming(
      $0.ResoureStreamingRequestModel request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streaming, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class StreamingResourceServiceBase extends $grpc.Service {
  $core.String get $name => 'daisy.StreamingResource';

  StreamingResourceServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ResoureStreamingRequestModel,
            $0.ResourceStreamingResponseModel>(
        'Streaming',
        streaming_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.ResoureStreamingRequestModel.fromBuffer(value),
        ($0.ResourceStreamingResponseModel value) => value.writeToBuffer()));
  }

  $async.Stream<$0.ResourceStreamingResponseModel> streaming_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ResoureStreamingRequestModel> request) async* {
    yield* streaming(call, await request);
  }

  $async.Stream<$0.ResourceStreamingResponseModel> streaming(
      $grpc.ServiceCall call, $0.ResoureStreamingRequestModel request);
}
