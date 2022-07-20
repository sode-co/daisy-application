///
//  Generated code. Do not modify.
//  source: file_transfer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use transferStatusDescriptor instead')
const TransferStatus$json = const {
  '1': 'TransferStatus',
  '2': const [
    const {'1': 'DONE', '2': 0},
    const {'1': 'STREAMING', '2': 1},
  ],
};

/// Descriptor for `TransferStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transferStatusDescriptor = $convert.base64Decode('Cg5UcmFuc2ZlclN0YXR1cxIICgRET05FEAASDQoJU1RSRUFNSU5HEAE=');
@$core.Deprecated('Use chunkDescriptor instead')
const Chunk$json = const {
  '1': 'Chunk',
  '2': const [
    const {'1': 'Content', '3': 1, '4': 1, '5': 12, '10': 'Content'},
  ],
};

/// Descriptor for `Chunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkDescriptor = $convert.base64Decode('CgVDaHVuaxIYCgdDb250ZW50GAEgASgMUgdDb250ZW50');
@$core.Deprecated('Use downloadModelDescriptor instead')
const DownloadModel$json = const {
  '1': 'DownloadModel',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.daisy.TransferStatus', '10': 'status'},
    const {'1': 'data', '3': 2, '4': 1, '5': 11, '6': '.daisy.Chunk', '10': 'data'},
  ],
};

/// Descriptor for `DownloadModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadModelDescriptor = $convert.base64Decode('Cg1Eb3dubG9hZE1vZGVsEi0KBnN0YXR1cxgBIAEoDjIVLmRhaXN5LlRyYW5zZmVyU3RhdHVzUgZzdGF0dXMSIAoEZGF0YRgCIAEoCzIMLmRhaXN5LkNodW5rUgRkYXRh');
@$core.Deprecated('Use downloadRequestDescriptor instead')
const DownloadRequest$json = const {
  '1': 'DownloadRequest',
};

/// Descriptor for `DownloadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadRequestDescriptor = $convert.base64Decode('Cg9Eb3dubG9hZFJlcXVlc3Q=');
@$core.Deprecated('Use streamingResourceModelRequestModelDescriptor instead')
const StreamingResourceModelRequestModel$json = const {
  '1': 'StreamingResourceModelRequestModel',
  '2': const [
    const {'1': 'TimeOffset', '3': 1, '4': 1, '5': 3, '10': 'TimeOffset'},
    const {'1': 'Count', '3': 2, '4': 1, '5': 5, '10': 'Count'},
    const {'1': 'rate', '3': 3, '4': 1, '5': 5, '10': 'rate'},
    const {'1': 'workspaceId', '3': 4, '4': 1, '5': 5, '10': 'workspaceId'},
    const {'1': 'workStatus', '3': 5, '4': 1, '5': 9, '10': 'workStatus'},
  ],
};

/// Descriptor for `StreamingResourceModelRequestModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamingResourceModelRequestModelDescriptor = $convert.base64Decode('CiJTdHJlYW1pbmdSZXNvdXJjZU1vZGVsUmVxdWVzdE1vZGVsEh4KClRpbWVPZmZzZXQYASABKANSClRpbWVPZmZzZXQSFAoFQ291bnQYAiABKAVSBUNvdW50EhIKBHJhdGUYAyABKAVSBHJhdGUSIAoLd29ya3NwYWNlSWQYBCABKAVSC3dvcmtzcGFjZUlkEh4KCndvcmtTdGF0dXMYBSABKAlSCndvcmtTdGF0dXM=');
@$core.Deprecated('Use streamingResourceFileRequestModelDescriptor instead')
const StreamingResourceFileRequestModel$json = const {
  '1': 'StreamingResourceFileRequestModel',
  '2': const [
    const {'1': 'Resources', '3': 1, '4': 3, '5': 9, '10': 'Resources'},
  ],
};

/// Descriptor for `StreamingResourceFileRequestModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamingResourceFileRequestModelDescriptor = $convert.base64Decode('CiFTdHJlYW1pbmdSZXNvdXJjZUZpbGVSZXF1ZXN0TW9kZWwSHAoJUmVzb3VyY2VzGAEgAygJUglSZXNvdXJjZXM=');
@$core.Deprecated('Use streamingResourceModelResponseModelDescriptor instead')
const StreamingResourceModelResponseModel$json = const {
  '1': 'StreamingResourceModelResponseModel',
  '2': const [
    const {'1': 'Resources', '3': 1, '4': 3, '5': 11, '6': '.daisy.Resource', '10': 'Resources'},
  ],
};

/// Descriptor for `StreamingResourceModelResponseModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamingResourceModelResponseModelDescriptor = $convert.base64Decode('CiNTdHJlYW1pbmdSZXNvdXJjZU1vZGVsUmVzcG9uc2VNb2RlbBItCglSZXNvdXJjZXMYASADKAsyDy5kYWlzeS5SZXNvdXJjZVIJUmVzb3VyY2Vz');
@$core.Deprecated('Use streamingResourceFileResponseModelDescriptor instead')
const StreamingResourceFileResponseModel$json = const {
  '1': 'StreamingResourceFileResponseModel',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.daisy.TransferStatus', '10': 'status'},
    const {'1': 'ResourceId', '3': 2, '4': 1, '5': 5, '10': 'ResourceId'},
    const {'1': 'binary', '3': 3, '4': 1, '5': 11, '6': '.daisy.Chunk', '10': 'binary'},
  ],
};

/// Descriptor for `StreamingResourceFileResponseModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamingResourceFileResponseModelDescriptor = $convert.base64Decode('CiJTdHJlYW1pbmdSZXNvdXJjZUZpbGVSZXNwb25zZU1vZGVsEi0KBnN0YXR1cxgBIAEoDjIVLmRhaXN5LlRyYW5zZmVyU3RhdHVzUgZzdGF0dXMSHgoKUmVzb3VyY2VJZBgCIAEoBVIKUmVzb3VyY2VJZBIkCgZiaW5hcnkYAyABKAsyDC5kYWlzeS5DaHVua1IGYmluYXJ5');
