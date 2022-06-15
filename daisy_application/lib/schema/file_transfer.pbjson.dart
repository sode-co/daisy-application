///
//  Generated code. Do not modify.
//  source: file_transfer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use statusDescriptor instead')
const Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'SUCCESS', '2': 0},
    const {'1': 'FAILED', '2': 1},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode('CgZTdGF0dXMSCwoHU1VDQ0VTUxAAEgoKBkZBSUxFRBAB');
@$core.Deprecated('Use chunkDescriptor instead')
const Chunk$json = const {
  '1': 'Chunk',
  '2': const [
    const {'1': 'Content', '3': 1, '4': 1, '5': 12, '10': 'Content'},
  ],
};

/// Descriptor for `Chunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkDescriptor = $convert.base64Decode('CgVDaHVuaxIYCgdDb250ZW50GAEgASgMUgdDb250ZW50');
@$core.Deprecated('Use transferStatusDescriptor instead')
const TransferStatus$json = const {
  '1': 'TransferStatus',
  '2': const [
    const {'1': 'Status', '3': 1, '4': 1, '5': 14, '6': '.filetransfer.Status', '10': 'Status'},
    const {'1': 'Message', '3': 2, '4': 1, '5': 9, '10': 'Message'},
  ],
};

/// Descriptor for `TransferStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferStatusDescriptor = $convert.base64Decode('Cg5UcmFuc2ZlclN0YXR1cxIsCgZTdGF0dXMYASABKA4yFC5maWxldHJhbnNmZXIuU3RhdHVzUgZTdGF0dXMSGAoHTWVzc2FnZRgCIAEoCVIHTWVzc2FnZQ==');
const $core.Map<$core.String, $core.dynamic> UploadServiceBase$json = const {
  '1': 'UploadService',
  '2': const [
    const {'1': 'Upload', '2': '.filetransfer.Chunk', '3': '.filetransfer.TransferStatus', '4': const {}, '5': true},
  ],
};

@$core.Deprecated('Use uploadServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> UploadServiceBase$messageJson = const {
  '.filetransfer.Chunk': Chunk$json,
  '.filetransfer.TransferStatus': TransferStatus$json,
};

/// Descriptor for `UploadService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List uploadServiceDescriptor = $convert.base64Decode('Cg1VcGxvYWRTZXJ2aWNlEj8KBlVwbG9hZBITLmZpbGV0cmFuc2Zlci5DaHVuaxocLmZpbGV0cmFuc2Zlci5UcmFuc2ZlclN0YXR1cyIAKAE=');
