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

class UploadServiceClient extends $grpc.Client {
  static final _$download =
      $grpc.ClientMethod<$0.DownloadRequest, $0.DownloadModel>(
          '/daisy.UploadService/Download',
          ($0.DownloadRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.DownloadModel.fromBuffer(value));

  UploadServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.DownloadModel> download($0.DownloadRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$download, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class UploadServiceBase extends $grpc.Service {
  $core.String get $name => 'daisy.UploadService';

  UploadServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.DownloadRequest, $0.DownloadModel>(
        'Download',
        download_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.DownloadRequest.fromBuffer(value),
        ($0.DownloadModel value) => value.writeToBuffer()));
  }

  $async.Stream<$0.DownloadModel> download_Pre($grpc.ServiceCall call,
      $async.Future<$0.DownloadRequest> request) async* {
    yield* download(call, await request);
  }

  $async.Stream<$0.DownloadModel> download(
      $grpc.ServiceCall call, $0.DownloadRequest request);
}

class ResourceServiceClient extends $grpc.Client {
  static final _$streamingResourceModel = $grpc.ClientMethod<
          $0.StreamingResourceModelRequestModel,
          $0.StreamingResourceModelResponseModel>(
      '/daisy.ResourceService/StreamingResourceModel',
      ($0.StreamingResourceModelRequestModel value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.StreamingResourceModelResponseModel.fromBuffer(value));
  static final _$streamingResourceFile = $grpc.ClientMethod<
          $0.StreamingResourceFileRequestModel,
          $0.StreamingResourceFileResponseModel>(
      '/daisy.ResourceService/StreamingResourceFile',
      ($0.StreamingResourceFileRequestModel value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.StreamingResourceFileResponseModel.fromBuffer(value));

  ResourceServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.StreamingResourceModelResponseModel>
      streamingResourceModel($0.StreamingResourceModelRequestModel request,
          {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamingResourceModel, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseStream<$0.StreamingResourceFileResponseModel>
      streamingResourceFile($0.StreamingResourceFileRequestModel request,
          {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$streamingResourceFile, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class ResourceServiceBase extends $grpc.Service {
  $core.String get $name => 'daisy.ResourceService';

  ResourceServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.StreamingResourceModelRequestModel,
            $0.StreamingResourceModelResponseModel>(
        'StreamingResourceModel',
        streamingResourceModel_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.StreamingResourceModelRequestModel.fromBuffer(value),
        ($0.StreamingResourceModelResponseModel value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StreamingResourceFileRequestModel,
            $0.StreamingResourceFileResponseModel>(
        'StreamingResourceFile',
        streamingResourceFile_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.StreamingResourceFileRequestModel.fromBuffer(value),
        ($0.StreamingResourceFileResponseModel value) =>
            value.writeToBuffer()));
  }

  $async.Stream<$0.StreamingResourceModelResponseModel>
      streamingResourceModel_Pre($grpc.ServiceCall call,
          $async.Future<$0.StreamingResourceModelRequestModel> request) async* {
    yield* streamingResourceModel(call, await request);
  }

  $async.Stream<$0.StreamingResourceFileResponseModel>
      streamingResourceFile_Pre($grpc.ServiceCall call,
          $async.Future<$0.StreamingResourceFileRequestModel> request) async* {
    yield* streamingResourceFile(call, await request);
  }

  $async.Stream<$0.StreamingResourceModelResponseModel> streamingResourceModel(
      $grpc.ServiceCall call, $0.StreamingResourceModelRequestModel request);
  $async.Stream<$0.StreamingResourceFileResponseModel> streamingResourceFile(
      $grpc.ServiceCall call, $0.StreamingResourceFileRequestModel request);
}
