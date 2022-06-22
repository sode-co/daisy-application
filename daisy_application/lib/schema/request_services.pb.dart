///
//  Generated code. Do not modify.
//  source: request_services.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'models.pb.dart' as $1;

class CreateRequestStreamingRequestModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateRequestStreamingRequestModel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'TimeOffset', protoName: 'TimeOffset')
    ..hasRequiredFields = false
  ;

  CreateRequestStreamingRequestModel._() : super();
  factory CreateRequestStreamingRequestModel({
    $fixnum.Int64? timeOffset,
  }) {
    final _result = create();
    if (timeOffset != null) {
      _result.timeOffset = timeOffset;
    }
    return _result;
  }
  factory CreateRequestStreamingRequestModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRequestStreamingRequestModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRequestStreamingRequestModel clone() => CreateRequestStreamingRequestModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRequestStreamingRequestModel copyWith(void Function(CreateRequestStreamingRequestModel) updates) => super.copyWith((message) => updates(message as CreateRequestStreamingRequestModel)) as CreateRequestStreamingRequestModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateRequestStreamingRequestModel create() => CreateRequestStreamingRequestModel._();
  CreateRequestStreamingRequestModel createEmptyInstance() => create();
  static $pb.PbList<CreateRequestStreamingRequestModel> createRepeated() => $pb.PbList<CreateRequestStreamingRequestModel>();
  @$core.pragma('dart2js:noInline')
  static CreateRequestStreamingRequestModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRequestStreamingRequestModel>(create);
  static CreateRequestStreamingRequestModel? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timeOffset => $_getI64(0);
  @$pb.TagNumber(1)
  set timeOffset($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimeOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimeOffset() => clearField(1);
}

class CreateRequestStreamingResponseModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateRequestStreamingResponseModel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..pc<$1.Request>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Requests', $pb.PbFieldType.PM, protoName: 'Requests', subBuilder: $1.Request.create)
    ..hasRequiredFields = false
  ;

  CreateRequestStreamingResponseModel._() : super();
  factory CreateRequestStreamingResponseModel({
    $core.Iterable<$1.Request>? requests,
  }) {
    final _result = create();
    if (requests != null) {
      _result.requests.addAll(requests);
    }
    return _result;
  }
  factory CreateRequestStreamingResponseModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateRequestStreamingResponseModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateRequestStreamingResponseModel clone() => CreateRequestStreamingResponseModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateRequestStreamingResponseModel copyWith(void Function(CreateRequestStreamingResponseModel) updates) => super.copyWith((message) => updates(message as CreateRequestStreamingResponseModel)) as CreateRequestStreamingResponseModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateRequestStreamingResponseModel create() => CreateRequestStreamingResponseModel._();
  CreateRequestStreamingResponseModel createEmptyInstance() => create();
  static $pb.PbList<CreateRequestStreamingResponseModel> createRepeated() => $pb.PbList<CreateRequestStreamingResponseModel>();
  @$core.pragma('dart2js:noInline')
  static CreateRequestStreamingResponseModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateRequestStreamingResponseModel>(create);
  static CreateRequestStreamingResponseModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Request> get requests => $_getList(0);
}

