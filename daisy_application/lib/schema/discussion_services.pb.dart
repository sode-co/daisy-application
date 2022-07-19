///
//  Generated code. Do not modify.
//  source: discussion_services.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'models.pb.dart' as $1;

class FetchDiscussionRequestModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchDiscussionRequestModel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'TimeOffset', protoName: 'TimeOffset')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Count', $pb.PbFieldType.O3, protoName: 'Count')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rate', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  FetchDiscussionRequestModel._() : super();
  factory FetchDiscussionRequestModel({
    $fixnum.Int64? timeOffset,
    $core.int? count,
    $core.int? rate,
  }) {
    final _result = create();
    if (timeOffset != null) {
      _result.timeOffset = timeOffset;
    }
    if (count != null) {
      _result.count = count;
    }
    if (rate != null) {
      _result.rate = rate;
    }
    return _result;
  }
  factory FetchDiscussionRequestModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchDiscussionRequestModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchDiscussionRequestModel clone() => FetchDiscussionRequestModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchDiscussionRequestModel copyWith(void Function(FetchDiscussionRequestModel) updates) => super.copyWith((message) => updates(message as FetchDiscussionRequestModel)) as FetchDiscussionRequestModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchDiscussionRequestModel create() => FetchDiscussionRequestModel._();
  FetchDiscussionRequestModel createEmptyInstance() => create();
  static $pb.PbList<FetchDiscussionRequestModel> createRepeated() => $pb.PbList<FetchDiscussionRequestModel>();
  @$core.pragma('dart2js:noInline')
  static FetchDiscussionRequestModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchDiscussionRequestModel>(create);
  static FetchDiscussionRequestModel? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timeOffset => $_getI64(0);
  @$pb.TagNumber(1)
  set timeOffset($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimeOffset() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimeOffset() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rate => $_getIZ(2);
  @$pb.TagNumber(3)
  set rate($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRate() => $_has(2);
  @$pb.TagNumber(3)
  void clearRate() => clearField(3);
}

class FetchDiscussionResponseModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'FetchDiscussionResponseModel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..pc<$1.Discussion>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Discussions', $pb.PbFieldType.PM, protoName: 'Discussions', subBuilder: $1.Discussion.create)
    ..hasRequiredFields = false
  ;

  FetchDiscussionResponseModel._() : super();
  factory FetchDiscussionResponseModel({
    $core.Iterable<$1.Discussion>? discussions,
  }) {
    final _result = create();
    if (discussions != null) {
      _result.discussions.addAll(discussions);
    }
    return _result;
  }
  factory FetchDiscussionResponseModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FetchDiscussionResponseModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FetchDiscussionResponseModel clone() => FetchDiscussionResponseModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FetchDiscussionResponseModel copyWith(void Function(FetchDiscussionResponseModel) updates) => super.copyWith((message) => updates(message as FetchDiscussionResponseModel)) as FetchDiscussionResponseModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static FetchDiscussionResponseModel create() => FetchDiscussionResponseModel._();
  FetchDiscussionResponseModel createEmptyInstance() => create();
  static $pb.PbList<FetchDiscussionResponseModel> createRepeated() => $pb.PbList<FetchDiscussionResponseModel>();
  @$core.pragma('dart2js:noInline')
  static FetchDiscussionResponseModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FetchDiscussionResponseModel>(create);
  static FetchDiscussionResponseModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Discussion> get discussions => $_getList(0);
}

