///
//  Generated code. Do not modify.
//  source: file_transfer.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'models.pb.dart' as $1;

import 'file_transfer.pbenum.dart';

export 'file_transfer.pbenum.dart';

class Chunk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Chunk', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Content', $pb.PbFieldType.OY, protoName: 'Content')
    ..hasRequiredFields = false
  ;

  Chunk._() : super();
  factory Chunk({
    $core.List<$core.int>? content,
  }) {
    final _result = create();
    if (content != null) {
      _result.content = content;
    }
    return _result;
  }
  factory Chunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Chunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Chunk clone() => Chunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Chunk copyWith(void Function(Chunk) updates) => super.copyWith((message) => updates(message as Chunk)) as Chunk; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Chunk create() => Chunk._();
  Chunk createEmptyInstance() => create();
  static $pb.PbList<Chunk> createRepeated() => $pb.PbList<Chunk>();
  @$core.pragma('dart2js:noInline')
  static Chunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chunk>(create);
  static Chunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get content => $_getN(0);
  @$pb.TagNumber(1)
  set content($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
}

class DownloadModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DownloadModel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..e<Status>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Status.SUCCESS, valueOf: Status.valueOf, enumValues: Status.values)
    ..aOM<Chunk>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: Chunk.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resourceId', protoName: 'resourceId')
    ..hasRequiredFields = false
  ;

  DownloadModel._() : super();
  factory DownloadModel({
    Status? status,
    Chunk? data,
    $core.String? resourceId,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (data != null) {
      _result.data = data;
    }
    if (resourceId != null) {
      _result.resourceId = resourceId;
    }
    return _result;
  }
  factory DownloadModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadModel clone() => DownloadModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadModel copyWith(void Function(DownloadModel) updates) => super.copyWith((message) => updates(message as DownloadModel)) as DownloadModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DownloadModel create() => DownloadModel._();
  DownloadModel createEmptyInstance() => create();
  static $pb.PbList<DownloadModel> createRepeated() => $pb.PbList<DownloadModel>();
  @$core.pragma('dart2js:noInline')
  static DownloadModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadModel>(create);
  static DownloadModel? _defaultInstance;

  @$pb.TagNumber(1)
  Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  Chunk get data => $_getN(1);
  @$pb.TagNumber(2)
  set data(Chunk v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasData() => $_has(1);
  @$pb.TagNumber(2)
  void clearData() => clearField(2);
  @$pb.TagNumber(2)
  Chunk ensureData() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get resourceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set resourceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResourceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearResourceId() => clearField(3);
}

class DownloadRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DownloadRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DownloadRequest._() : super();
  factory DownloadRequest() => create();
  factory DownloadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DownloadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DownloadRequest clone() => DownloadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DownloadRequest copyWith(void Function(DownloadRequest) updates) => super.copyWith((message) => updates(message as DownloadRequest)) as DownloadRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DownloadRequest create() => DownloadRequest._();
  DownloadRequest createEmptyInstance() => create();
  static $pb.PbList<DownloadRequest> createRepeated() => $pb.PbList<DownloadRequest>();
  @$core.pragma('dart2js:noInline')
  static DownloadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DownloadRequest>(create);
  static DownloadRequest? _defaultInstance;
}

class ResoureStreamingRequestModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResoureStreamingRequestModel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..aInt64(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'TimeOffset', protoName: 'TimeOffset')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Count', $pb.PbFieldType.O3, protoName: 'Count')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rate', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'WorkspaceId', $pb.PbFieldType.O3, protoName: 'WorkspaceId')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'WorkStatus', protoName: 'WorkStatus')
    ..hasRequiredFields = false
  ;

  ResoureStreamingRequestModel._() : super();
  factory ResoureStreamingRequestModel({
    $fixnum.Int64? timeOffset,
    $core.int? count,
    $core.int? rate,
    $core.int? workspaceId,
    $core.String? workStatus,
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
    if (workspaceId != null) {
      _result.workspaceId = workspaceId;
    }
    if (workStatus != null) {
      _result.workStatus = workStatus;
    }
    return _result;
  }
  factory ResoureStreamingRequestModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResoureStreamingRequestModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResoureStreamingRequestModel clone() => ResoureStreamingRequestModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResoureStreamingRequestModel copyWith(void Function(ResoureStreamingRequestModel) updates) => super.copyWith((message) => updates(message as ResoureStreamingRequestModel)) as ResoureStreamingRequestModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResoureStreamingRequestModel create() => ResoureStreamingRequestModel._();
  ResoureStreamingRequestModel createEmptyInstance() => create();
  static $pb.PbList<ResoureStreamingRequestModel> createRepeated() => $pb.PbList<ResoureStreamingRequestModel>();
  @$core.pragma('dart2js:noInline')
  static ResoureStreamingRequestModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResoureStreamingRequestModel>(create);
  static ResoureStreamingRequestModel? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.int get workspaceId => $_getIZ(3);
  @$pb.TagNumber(4)
  set workspaceId($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWorkspaceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearWorkspaceId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get workStatus => $_getSZ(4);
  @$pb.TagNumber(5)
  set workStatus($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWorkStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearWorkStatus() => clearField(5);
}

class ResourceStreamingResponseModel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResourceStreamingResponseModel', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..pc<$1.Resource>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'resource', $pb.PbFieldType.PM, subBuilder: $1.Resource.create)
    ..aOM<DownloadModel>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'download', subBuilder: DownloadModel.create)
    ..hasRequiredFields = false
  ;

  ResourceStreamingResponseModel._() : super();
  factory ResourceStreamingResponseModel({
    $core.Iterable<$1.Resource>? resource,
    DownloadModel? download,
  }) {
    final _result = create();
    if (resource != null) {
      _result.resource.addAll(resource);
    }
    if (download != null) {
      _result.download = download;
    }
    return _result;
  }
  factory ResourceStreamingResponseModel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResourceStreamingResponseModel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResourceStreamingResponseModel clone() => ResourceStreamingResponseModel()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResourceStreamingResponseModel copyWith(void Function(ResourceStreamingResponseModel) updates) => super.copyWith((message) => updates(message as ResourceStreamingResponseModel)) as ResourceStreamingResponseModel; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResourceStreamingResponseModel create() => ResourceStreamingResponseModel._();
  ResourceStreamingResponseModel createEmptyInstance() => create();
  static $pb.PbList<ResourceStreamingResponseModel> createRepeated() => $pb.PbList<ResourceStreamingResponseModel>();
  @$core.pragma('dart2js:noInline')
  static ResourceStreamingResponseModel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResourceStreamingResponseModel>(create);
  static ResourceStreamingResponseModel? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Resource> get resource => $_getList(0);

  @$pb.TagNumber(2)
  DownloadModel get download => $_getN(1);
  @$pb.TagNumber(2)
  set download(DownloadModel v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDownload() => $_has(1);
  @$pb.TagNumber(2)
  void clearDownload() => clearField(2);
  @$pb.TagNumber(2)
  DownloadModel ensureDownload() => $_ensure(1);
}

