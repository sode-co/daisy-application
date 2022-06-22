///
//  Generated code. Do not modify.
//  source: models.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use userDescriptor instead')
const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'Id', '3': 1, '4': 1, '5': 5, '10': 'Id'},
    const {'1': 'ObjectId', '3': 2, '4': 1, '5': 9, '10': 'ObjectId'},
    const {'1': 'FirstName', '3': 3, '4': 1, '5': 9, '10': 'FirstName'},
    const {'1': 'LastName', '3': 4, '4': 1, '5': 9, '10': 'LastName'},
    const {'1': 'DisplayName', '3': 5, '4': 1, '5': 9, '10': 'DisplayName'},
    const {'1': 'Role', '3': 6, '4': 1, '5': 9, '10': 'Role'},
    const {'1': 'Email', '3': 7, '4': 1, '5': 9, '10': 'Email'},
    const {'1': 'Phone', '3': 8, '4': 1, '5': 9, '10': 'Phone'},
    const {'1': 'address', '3': 10, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'avatar', '3': 11, '4': 1, '5': 9, '10': 'avatar'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAklkGAEgASgFUgJJZBIaCghPYmplY3RJZBgCIAEoCVIIT2JqZWN0SWQSHAoJRmlyc3ROYW1lGAMgASgJUglGaXJzdE5hbWUSGgoITGFzdE5hbWUYBCABKAlSCExhc3ROYW1lEiAKC0Rpc3BsYXlOYW1lGAUgASgJUgtEaXNwbGF5TmFtZRISCgRSb2xlGAYgASgJUgRSb2xlEhQKBUVtYWlsGAcgASgJUgVFbWFpbBIUCgVQaG9uZRgIIAEoCVIFUGhvbmUSGAoHYWRkcmVzcxgKIAEoCVIHYWRkcmVzcxIWCgZhdmF0YXIYCyABKAlSBmF2YXRhcg==');
@$core.Deprecated('Use categoryDescriptor instead')
const Category$json = const {
  '1': 'Category',
  '2': const [
    const {'1': 'Id', '3': 1, '4': 1, '5': 5, '10': 'Id'},
    const {'1': 'ObjectId', '3': 2, '4': 1, '5': 9, '10': 'ObjectId'},
    const {'1': 'Name', '3': 3, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'Type', '3': 4, '4': 1, '5': 9, '10': 'Type'},
  ],
};

/// Descriptor for `Category`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List categoryDescriptor = $convert.base64Decode(
    'CghDYXRlZ29yeRIOCgJJZBgBIAEoBVICSWQSGgoIT2JqZWN0SWQYAiABKAlSCE9iamVjdElkEhIKBE5hbWUYAyABKAlSBE5hbWUSEgoEVHlwZRgEIAEoCVIEVHlwZQ==');
@$core.Deprecated('Use requestDescriptor instead')
const Request$json = const {
  '1': 'Request',
  '2': const [
    const {'1': 'Id', '3': 1, '4': 1, '5': 5, '10': 'Id'},
    const {'1': 'CreatedAt', '3': 2, '4': 1, '5': 3, '10': 'CreatedAt'},
    const {'1': 'ObjectId', '3': 3, '4': 1, '5': 9, '10': 'ObjectId'},
    const {
      '1': 'Customer',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.daisy.User',
      '10': 'Customer'
    },
    const {
      '1': 'Category',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.daisy.Category',
      '10': 'Category'
    },
    const {'1': 'Title', '3': 6, '4': 1, '5': 9, '10': 'Title'},
    const {'1': 'Description', '3': 7, '4': 1, '5': 9, '10': 'Description'},
    const {'1': 'Budget', '3': 8, '4': 1, '5': 2, '10': 'Budget'},
    const {'1': 'Timeline', '3': 9, '4': 1, '5': 3, '10': 'Timeline'},
    const {'1': 'Status', '3': 10, '4': 1, '5': 9, '10': 'Status'},
  ],
};

/// Descriptor for `Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDescriptor = $convert.base64Decode(
    'CgdSZXF1ZXN0Eg4KAklkGAEgASgFUgJJZBIcCglDcmVhdGVkQXQYAiABKANSCUNyZWF0ZWRBdBIaCghPYmplY3RJZBgDIAEoCVIIT2JqZWN0SWQSJwoIQ3VzdG9tZXIYBCABKAsyCy5kYWlzeS5Vc2VyUghDdXN0b21lchIrCghDYXRlZ29yeRgFIAEoCzIPLmRhaXN5LkNhdGVnb3J5UghDYXRlZ29yeRIUCgVUaXRsZRgGIAEoCVIFVGl0bGUSIAoLRGVzY3JpcHRpb24YByABKAlSC0Rlc2NyaXB0aW9uEhYKBkJ1ZGdldBgIIAEoAlIGQnVkZ2V0EhoKCFRpbWVsaW5lGAkgASgDUghUaW1lbGluZRIWCgZTdGF0dXMYCiABKAlSBlN0YXR1cw==');
