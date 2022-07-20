///
//  Generated code. Do not modify.
//  source: file_transfer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use statusDescriptor instead')
const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'SUCCESS', '2': 0},
    const {'1': 'FAILED', '2': 1},
    const {'1': 'STREAMING', '2': 2},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode('CgZTdGF0dXMSCwoHU1VDQ0VTUxAAEgoKBkZBSUxFRBABEg0KCVNUUkVBTUlORxAC');
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
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.daisy.Status', '10': 'status'},
    const {'1': 'data', '3': 2, '4': 1, '5': 11, '6': '.daisy.Chunk', '10': 'data'},
    const {'1': 'resourceId', '3': 3, '4': 1, '5': 9, '10': 'resourceId'},
  ],
};

/// Descriptor for `DownloadModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadModelDescriptor = $convert.base64Decode('Cg1Eb3dubG9hZE1vZGVsEiUKBnN0YXR1cxgBIAEoDjINLmRhaXN5LlN0YXR1c1IGc3RhdHVzEiAKBGRhdGEYAiABKAsyDC5kYWlzeS5DaHVua1IEZGF0YRIeCgpyZXNvdXJjZUlkGAMgASgJUgpyZXNvdXJjZUlk');
@$core.Deprecated('Use downloadRequestDescriptor instead')
const DownloadRequest$json = const {
  '1': 'DownloadRequest',
};

/// Descriptor for `DownloadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List downloadRequestDescriptor = $convert.base64Decode('Cg9Eb3dubG9hZFJlcXVlc3Q=');
@$core.Deprecated('Use resoureStreamingRequestModelDescriptor instead')
const ResoureStreamingRequestModel$json = const {
  '1': 'ResoureStreamingRequestModel',
  '2': const [
    const {'1': 'TimeOffset', '3': 1, '4': 1, '5': 3, '10': 'TimeOffset'},
    const {'1': 'Count', '3': 2, '4': 1, '5': 5, '10': 'Count'},
    const {'1': 'rate', '3': 3, '4': 1, '5': 5, '10': 'rate'},
    const {'1': 'WorkspaceId', '3': 4, '4': 1, '5': 5, '10': 'WorkspaceId'},
    const {'1': 'WorkStatus', '3': 5, '4': 1, '5': 9, '10': 'WorkStatus'},
  ],
};

/// Descriptor for `ResoureStreamingRequestModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resoureStreamingRequestModelDescriptor = $convert.base64Decode('ChxSZXNvdXJlU3RyZWFtaW5nUmVxdWVzdE1vZGVsEh4KClRpbWVPZmZzZXQYASABKANSClRpbWVPZmZzZXQSFAoFQ291bnQYAiABKAVSBUNvdW50EhIKBHJhdGUYAyABKAVSBHJhdGUSIAoLV29ya3NwYWNlSWQYBCABKAVSC1dvcmtzcGFjZUlkEh4KCldvcmtTdGF0dXMYBSABKAlSCldvcmtTdGF0dXM=');
@$core.Deprecated('Use resourceStreamingResponseModelDescriptor instead')
const ResourceStreamingResponseModel$json = const {
  '1': 'ResourceStreamingResponseModel',
  '2': const [
    const {'1': 'resource', '3': 1, '4': 3, '5': 11, '6': '.daisy.Resource', '10': 'resource'},
    const {'1': 'download', '3': 2, '4': 1, '5': 11, '6': '.daisy.DownloadModel', '10': 'download'},
  ],
};

/// Descriptor for `ResourceStreamingResponseModel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resourceStreamingResponseModelDescriptor = $convert.base64Decode('Ch5SZXNvdXJjZVN0cmVhbWluZ1Jlc3BvbnNlTW9kZWwSKwoIcmVzb3VyY2UYASADKAsyDy5kYWlzeS5SZXNvdXJjZVIIcmVzb3VyY2USMAoIZG93bmxvYWQYAiABKAsyFC5kYWlzeS5Eb3dubG9hZE1vZGVsUghkb3dubG9hZA==');
