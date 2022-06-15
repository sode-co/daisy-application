///
//  Generated code. Do not modify.
//  source: file_transfer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'file_transfer.pb.dart' as $0;
import 'file_transfer.pbjson.dart';

export 'file_transfer.pb.dart';

abstract class UploadServiceBase extends $pb.GeneratedService {
  $async.Future<$0.TransferStatus> upload($pb.ServerContext ctx, $0.Chunk request);
  $async.Future<$0.DownloadModel> download($pb.ServerContext ctx, $0.DownloadRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Upload': return $0.Chunk();
      case 'Download': return $0.DownloadRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Upload': return this.upload(ctx, request as $0.Chunk);
      case 'Download': return this.download(ctx, request as $0.DownloadRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => UploadServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => UploadServiceBase$messageJson;
}

