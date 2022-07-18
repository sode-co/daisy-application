///
//  Generated code. Do not modify.
//  source: file_transfer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'file_transfer.pb.dart' as $0;
export 'file_transfer.pb.dart';

class UploadServiceClient extends $grpc.Client {
  static final _$upload = $grpc.ClientMethod<$0.Chunk, $0.TransferStatus>(
      '/filetransfer.UploadService/Upload',
      ($0.Chunk value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TransferStatus.fromBuffer(value));

  UploadServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.TransferStatus> upload(
      $async.Stream<$0.Chunk> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$upload, request, options: options).single;
  }
}

abstract class UploadServiceBase extends $grpc.Service {
  $core.String get $name => 'filetransfer.UploadService';

  UploadServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Chunk, $0.TransferStatus>(
        'Upload',
        upload,
        true,
        false,
        ($core.List<$core.int> value) => $0.Chunk.fromBuffer(value),
        ($0.TransferStatus value) => value.writeToBuffer()));
  }

  $async.Future<$0.TransferStatus> upload(
      $grpc.ServiceCall call, $async.Stream<$0.Chunk> request);
}
