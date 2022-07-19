///
//  Generated code. Do not modify.
//  source: models.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'User', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Id', $pb.PbFieldType.O3, protoName: 'Id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ObjectId', protoName: 'ObjectId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'FirstName', protoName: 'FirstName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'LastName', protoName: 'LastName')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'DisplayName', protoName: 'DisplayName')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Role', protoName: 'Role')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Email', protoName: 'Email')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Phone', protoName: 'Phone')
    ..aOS(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'avatar')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User({
    $core.int? id,
    $core.String? objectId,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? displayName,
    $core.String? role,
    $core.String? email,
    $core.String? phone,
    $core.String? address,
    $core.String? avatar,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (objectId != null) {
      _result.objectId = objectId;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    if (displayName != null) {
      _result.displayName = displayName;
    }
    if (role != null) {
      _result.role = role;
    }
    if (email != null) {
      _result.email = email;
    }
    if (phone != null) {
      _result.phone = phone;
    }
    if (address != null) {
      _result.address = address;
    }
    if (avatar != null) {
      _result.avatar = avatar;
    }
    return _result;
  }
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get objectId => $_getSZ(1);
  @$pb.TagNumber(2)
  set objectId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasObjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearObjectId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get firstName => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirstName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastName => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get displayName => $_getSZ(4);
  @$pb.TagNumber(5)
  set displayName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDisplayName() => $_has(4);
  @$pb.TagNumber(5)
  void clearDisplayName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get role => $_getSZ(5);
  @$pb.TagNumber(6)
  set role($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRole() => $_has(5);
  @$pb.TagNumber(6)
  void clearRole() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get email => $_getSZ(6);
  @$pb.TagNumber(7)
  set email($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEmail() => $_has(6);
  @$pb.TagNumber(7)
  void clearEmail() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get phone => $_getSZ(7);
  @$pb.TagNumber(8)
  set phone($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPhone() => $_has(7);
  @$pb.TagNumber(8)
  void clearPhone() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get address => $_getSZ(8);
  @$pb.TagNumber(9)
  set address($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAddress() => $_has(8);
  @$pb.TagNumber(9)
  void clearAddress() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get avatar => $_getSZ(9);
  @$pb.TagNumber(10)
  set avatar($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAvatar() => $_has(9);
  @$pb.TagNumber(10)
  void clearAvatar() => clearField(10);
}

class Category extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Category', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Id', $pb.PbFieldType.O3, protoName: 'Id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ObjectId', protoName: 'ObjectId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Name', protoName: 'Name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Type', protoName: 'Type')
    ..hasRequiredFields = false
  ;

  Category._() : super();
  factory Category({
    $core.int? id,
    $core.String? objectId,
    $core.String? name,
    $core.String? type,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (objectId != null) {
      _result.objectId = objectId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (type != null) {
      _result.type = type;
    }
    return _result;
  }
  factory Category.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Category.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Category clone() => Category()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Category copyWith(void Function(Category) updates) => super.copyWith((message) => updates(message as Category)) as Category; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Category create() => Category._();
  Category createEmptyInstance() => create();
  static $pb.PbList<Category> createRepeated() => $pb.PbList<Category>();
  @$core.pragma('dart2js:noInline')
  static Category getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Category>(create);
  static Category? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get objectId => $_getSZ(1);
  @$pb.TagNumber(2)
  set objectId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasObjectId() => $_has(1);
  @$pb.TagNumber(2)
  void clearObjectId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);
}

class Request extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Request', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Id', $pb.PbFieldType.O3, protoName: 'Id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CreatedAt', protoName: 'CreatedAt')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ObjectId', protoName: 'ObjectId')
    ..aOM<User>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Customer', protoName: 'Customer', subBuilder: User.create)
    ..aOM<Category>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Category', protoName: 'Category', subBuilder: Category.create)
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Title', protoName: 'Title')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Description', protoName: 'Description')
    ..a<$core.double>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Budget', $pb.PbFieldType.OF, protoName: 'Budget')
    ..aInt64(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Timeline', protoName: 'Timeline')
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Status', protoName: 'Status')
    ..hasRequiredFields = false
  ;

  Request._() : super();
  factory Request({
    $core.int? id,
    $fixnum.Int64? createdAt,
    $core.String? objectId,
    User? customer,
    Category? category,
    $core.String? title,
    $core.String? description,
    $core.double? budget,
    $fixnum.Int64? timeline,
    $core.String? status,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (objectId != null) {
      _result.objectId = objectId;
    }
    if (customer != null) {
      _result.customer = customer;
    }
    if (category != null) {
      _result.category = category;
    }
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    if (budget != null) {
      _result.budget = budget;
    }
    if (timeline != null) {
      _result.timeline = timeline;
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request clone() => Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request copyWith(void Function(Request) updates) => super.copyWith((message) => updates(message as Request)) as Request; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Request create() => Request._();
  Request createEmptyInstance() => create();
  static $pb.PbList<Request> createRepeated() => $pb.PbList<Request>();
  @$core.pragma('dart2js:noInline')
  static Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request>(create);
  static Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(2)
  set createdAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get objectId => $_getSZ(2);
  @$pb.TagNumber(3)
  set objectId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasObjectId() => $_has(2);
  @$pb.TagNumber(3)
  void clearObjectId() => clearField(3);

  @$pb.TagNumber(4)
  User get customer => $_getN(3);
  @$pb.TagNumber(4)
  set customer(User v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCustomer() => $_has(3);
  @$pb.TagNumber(4)
  void clearCustomer() => clearField(4);
  @$pb.TagNumber(4)
  User ensureCustomer() => $_ensure(3);

  @$pb.TagNumber(5)
  Category get category => $_getN(4);
  @$pb.TagNumber(5)
  set category(Category v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategory() => clearField(5);
  @$pb.TagNumber(5)
  Category ensureCategory() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get title => $_getSZ(5);
  @$pb.TagNumber(6)
  set title($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTitle() => $_has(5);
  @$pb.TagNumber(6)
  void clearTitle() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get description => $_getSZ(6);
  @$pb.TagNumber(7)
  set description($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearDescription() => clearField(7);

  @$pb.TagNumber(8)
  $core.double get budget => $_getN(7);
  @$pb.TagNumber(8)
  set budget($core.double v) { $_setFloat(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBudget() => $_has(7);
  @$pb.TagNumber(8)
  void clearBudget() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get timeline => $_getI64(8);
  @$pb.TagNumber(9)
  set timeline($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTimeline() => $_has(8);
  @$pb.TagNumber(9)
  void clearTimeline() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get status => $_getSZ(9);
  @$pb.TagNumber(10)
  set status($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearStatus() => clearField(10);
}

class Project extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Project', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Id', $pb.PbFieldType.O3, protoName: 'Id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CreatedAt', protoName: 'CreatedAt')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ObjectId', protoName: 'ObjectId')
    ..aOM<User>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Customer', protoName: 'Customer', subBuilder: User.create)
    ..aOM<Category>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Category', protoName: 'Category', subBuilder: Category.create)
    ..aInt64(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ResolvedAt', protoName: 'ResolvedAt')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Data', protoName: 'Data')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Name', protoName: 'Name')
    ..a<$core.double>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Budget', $pb.PbFieldType.OF, protoName: 'Budget')
    ..aInt64(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Timeline', protoName: 'Timeline')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Status', protoName: 'Status')
    ..aOM<Request>(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'request', subBuilder: Request.create)
    ..aOM<User>(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Freelancer', protoName: 'Freelancer', subBuilder: User.create)
    ..aOS(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Description', protoName: 'Description')
    ..pc<Workspace>(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Workspaces', $pb.PbFieldType.PM, protoName: 'Workspaces', subBuilder: Workspace.create)
    ..hasRequiredFields = false
  ;

  Project._() : super();
  factory Project({
    $core.int? id,
    $fixnum.Int64? createdAt,
    $core.String? objectId,
    User? customer,
    Category? category,
    $fixnum.Int64? resolvedAt,
    $core.String? data,
    $core.String? name,
    $core.double? budget,
    $fixnum.Int64? timeline,
    $core.String? status,
    Request? request,
    User? freelancer,
    $core.String? description,
    $core.Iterable<Workspace>? workspaces,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (objectId != null) {
      _result.objectId = objectId;
    }
    if (customer != null) {
      _result.customer = customer;
    }
    if (category != null) {
      _result.category = category;
    }
    if (resolvedAt != null) {
      _result.resolvedAt = resolvedAt;
    }
    if (data != null) {
      _result.data = data;
    }
    if (name != null) {
      _result.name = name;
    }
    if (budget != null) {
      _result.budget = budget;
    }
    if (timeline != null) {
      _result.timeline = timeline;
    }
    if (status != null) {
      _result.status = status;
    }
    if (request != null) {
      _result.request = request;
    }
    if (freelancer != null) {
      _result.freelancer = freelancer;
    }
    if (description != null) {
      _result.description = description;
    }
    if (workspaces != null) {
      _result.workspaces.addAll(workspaces);
    }
    return _result;
  }
  factory Project.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Project.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Project clone() => Project()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Project copyWith(void Function(Project) updates) => super.copyWith((message) => updates(message as Project)) as Project; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Project create() => Project._();
  Project createEmptyInstance() => create();
  static $pb.PbList<Project> createRepeated() => $pb.PbList<Project>();
  @$core.pragma('dart2js:noInline')
  static Project getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Project>(create);
  static Project? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(2)
  set createdAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get objectId => $_getSZ(2);
  @$pb.TagNumber(3)
  set objectId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasObjectId() => $_has(2);
  @$pb.TagNumber(3)
  void clearObjectId() => clearField(3);

  @$pb.TagNumber(4)
  User get customer => $_getN(3);
  @$pb.TagNumber(4)
  set customer(User v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCustomer() => $_has(3);
  @$pb.TagNumber(4)
  void clearCustomer() => clearField(4);
  @$pb.TagNumber(4)
  User ensureCustomer() => $_ensure(3);

  @$pb.TagNumber(5)
  Category get category => $_getN(4);
  @$pb.TagNumber(5)
  set category(Category v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCategory() => $_has(4);
  @$pb.TagNumber(5)
  void clearCategory() => clearField(5);
  @$pb.TagNumber(5)
  Category ensureCategory() => $_ensure(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get resolvedAt => $_getI64(5);
  @$pb.TagNumber(6)
  set resolvedAt($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasResolvedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearResolvedAt() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get data => $_getSZ(6);
  @$pb.TagNumber(7)
  set data($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasData() => $_has(6);
  @$pb.TagNumber(7)
  void clearData() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get name => $_getSZ(7);
  @$pb.TagNumber(8)
  set name($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasName() => $_has(7);
  @$pb.TagNumber(8)
  void clearName() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get budget => $_getN(8);
  @$pb.TagNumber(9)
  set budget($core.double v) { $_setFloat(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasBudget() => $_has(8);
  @$pb.TagNumber(9)
  void clearBudget() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get timeline => $_getI64(9);
  @$pb.TagNumber(10)
  set timeline($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTimeline() => $_has(9);
  @$pb.TagNumber(10)
  void clearTimeline() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get status => $_getSZ(10);
  @$pb.TagNumber(11)
  set status($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearStatus() => clearField(11);

  @$pb.TagNumber(12)
  Request get request => $_getN(11);
  @$pb.TagNumber(12)
  set request(Request v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasRequest() => $_has(11);
  @$pb.TagNumber(12)
  void clearRequest() => clearField(12);
  @$pb.TagNumber(12)
  Request ensureRequest() => $_ensure(11);

  @$pb.TagNumber(13)
  User get freelancer => $_getN(12);
  @$pb.TagNumber(13)
  set freelancer(User v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasFreelancer() => $_has(12);
  @$pb.TagNumber(13)
  void clearFreelancer() => clearField(13);
  @$pb.TagNumber(13)
  User ensureFreelancer() => $_ensure(12);

  @$pb.TagNumber(14)
  $core.String get description => $_getSZ(13);
  @$pb.TagNumber(14)
  set description($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasDescription() => $_has(13);
  @$pb.TagNumber(14)
  void clearDescription() => clearField(14);

  @$pb.TagNumber(15)
  $core.List<Workspace> get workspaces => $_getList(14);
}

class Workspace extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Workspace', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Id', $pb.PbFieldType.O3, protoName: 'Id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CreatedAt', protoName: 'CreatedAt')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ObjectId', protoName: 'ObjectId')
    ..aOM<Request>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Request', protoName: 'Request', subBuilder: Request.create)
    ..aOM<Project>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Project', protoName: 'Project', subBuilder: Project.create)
    ..pc<Discussion>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Discussions', $pb.PbFieldType.PM, protoName: 'Discussions', subBuilder: Discussion.create)
    ..pc<Resource>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Resources', $pb.PbFieldType.PM, protoName: 'Resources', subBuilder: Resource.create)
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Status', protoName: 'Status')
    ..hasRequiredFields = false
  ;

  Workspace._() : super();
  factory Workspace({
    $core.int? id,
    $fixnum.Int64? createdAt,
    $core.String? objectId,
    Request? request,
    Project? project,
    $core.Iterable<Discussion>? discussions,
    $core.Iterable<Resource>? resources,
    $core.String? status,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (objectId != null) {
      _result.objectId = objectId;
    }
    if (request != null) {
      _result.request = request;
    }
    if (project != null) {
      _result.project = project;
    }
    if (discussions != null) {
      _result.discussions.addAll(discussions);
    }
    if (resources != null) {
      _result.resources.addAll(resources);
    }
    if (status != null) {
      _result.status = status;
    }
    return _result;
  }
  factory Workspace.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Workspace.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Workspace clone() => Workspace()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Workspace copyWith(void Function(Workspace) updates) => super.copyWith((message) => updates(message as Workspace)) as Workspace; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Workspace create() => Workspace._();
  Workspace createEmptyInstance() => create();
  static $pb.PbList<Workspace> createRepeated() => $pb.PbList<Workspace>();
  @$core.pragma('dart2js:noInline')
  static Workspace getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Workspace>(create);
  static Workspace? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(2)
  set createdAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get objectId => $_getSZ(2);
  @$pb.TagNumber(3)
  set objectId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasObjectId() => $_has(2);
  @$pb.TagNumber(3)
  void clearObjectId() => clearField(3);

  @$pb.TagNumber(4)
  Request get request => $_getN(3);
  @$pb.TagNumber(4)
  set request(Request v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasRequest() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequest() => clearField(4);
  @$pb.TagNumber(4)
  Request ensureRequest() => $_ensure(3);

  @$pb.TagNumber(5)
  Project get project => $_getN(4);
  @$pb.TagNumber(5)
  set project(Project v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasProject() => $_has(4);
  @$pb.TagNumber(5)
  void clearProject() => clearField(5);
  @$pb.TagNumber(5)
  Project ensureProject() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<Discussion> get discussions => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<Resource> get resources => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get status => $_getSZ(7);
  @$pb.TagNumber(8)
  set status($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => clearField(8);
}

class Discussion extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Discussion', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Id', $pb.PbFieldType.O3, protoName: 'Id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CreatedAt', protoName: 'CreatedAt')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ObjectId', protoName: 'ObjectId')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Type', protoName: 'Type')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Content', protoName: 'Content')
    ..aOM<User>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sender', protoName: 'Sender', subBuilder: User.create)
    ..aOM<Workspace>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Workspace', protoName: 'Workspace', subBuilder: Workspace.create)
    ..hasRequiredFields = false
  ;

  Discussion._() : super();
  factory Discussion({
    $core.int? id,
    $fixnum.Int64? createdAt,
    $core.String? objectId,
    $core.String? type,
    $core.String? content,
    User? sender,
    Workspace? workspace,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (objectId != null) {
      _result.objectId = objectId;
    }
    if (type != null) {
      _result.type = type;
    }
    if (content != null) {
      _result.content = content;
    }
    if (sender != null) {
      _result.sender = sender;
    }
    if (workspace != null) {
      _result.workspace = workspace;
    }
    return _result;
  }
  factory Discussion.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Discussion.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Discussion clone() => Discussion()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Discussion copyWith(void Function(Discussion) updates) => super.copyWith((message) => updates(message as Discussion)) as Discussion; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Discussion create() => Discussion._();
  Discussion createEmptyInstance() => create();
  static $pb.PbList<Discussion> createRepeated() => $pb.PbList<Discussion>();
  @$core.pragma('dart2js:noInline')
  static Discussion getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Discussion>(create);
  static Discussion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(2)
  set createdAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get objectId => $_getSZ(2);
  @$pb.TagNumber(3)
  set objectId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasObjectId() => $_has(2);
  @$pb.TagNumber(3)
  void clearObjectId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get content => $_getSZ(4);
  @$pb.TagNumber(5)
  set content($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasContent() => $_has(4);
  @$pb.TagNumber(5)
  void clearContent() => clearField(5);

  @$pb.TagNumber(6)
  User get sender => $_getN(5);
  @$pb.TagNumber(6)
  set sender(User v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasSender() => $_has(5);
  @$pb.TagNumber(6)
  void clearSender() => clearField(6);
  @$pb.TagNumber(6)
  User ensureSender() => $_ensure(5);

  @$pb.TagNumber(7)
  Workspace get workspace => $_getN(6);
  @$pb.TagNumber(7)
  set workspace(Workspace v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasWorkspace() => $_has(6);
  @$pb.TagNumber(7)
  void clearWorkspace() => clearField(7);
  @$pb.TagNumber(7)
  Workspace ensureWorkspace() => $_ensure(6);
}

class Resource extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Resource', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Id', $pb.PbFieldType.O3, protoName: 'Id')
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'CreatedAt', protoName: 'CreatedAt')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ObjectId', protoName: 'ObjectId')
    ..aOM<File>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'File', protoName: 'File', subBuilder: File.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'WorkStatus', protoName: 'WorkStatus')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ResourceKey', protoName: 'ResourceKey')
    ..aOM<Workspace>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Workspace', protoName: 'Workspace', subBuilder: Workspace.create)
    ..hasRequiredFields = false
  ;

  Resource._() : super();
  factory Resource({
    $core.int? id,
    $fixnum.Int64? createdAt,
    $core.String? objectId,
    File? file,
    $core.String? workStatus,
    $core.String? resourceKey,
    Workspace? workspace,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (objectId != null) {
      _result.objectId = objectId;
    }
    if (file != null) {
      _result.file = file;
    }
    if (workStatus != null) {
      _result.workStatus = workStatus;
    }
    if (resourceKey != null) {
      _result.resourceKey = resourceKey;
    }
    if (workspace != null) {
      _result.workspace = workspace;
    }
    return _result;
  }
  factory Resource.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Resource.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Resource clone() => Resource()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Resource copyWith(void Function(Resource) updates) => super.copyWith((message) => updates(message as Resource)) as Resource; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Resource create() => Resource._();
  Resource createEmptyInstance() => create();
  static $pb.PbList<Resource> createRepeated() => $pb.PbList<Resource>();
  @$core.pragma('dart2js:noInline')
  static Resource getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Resource>(create);
  static Resource? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(2)
  set createdAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get objectId => $_getSZ(2);
  @$pb.TagNumber(3)
  set objectId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasObjectId() => $_has(2);
  @$pb.TagNumber(3)
  void clearObjectId() => clearField(3);

  @$pb.TagNumber(4)
  File get file => $_getN(3);
  @$pb.TagNumber(4)
  set file(File v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFile() => $_has(3);
  @$pb.TagNumber(4)
  void clearFile() => clearField(4);
  @$pb.TagNumber(4)
  File ensureFile() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get workStatus => $_getSZ(4);
  @$pb.TagNumber(5)
  set workStatus($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWorkStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearWorkStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get resourceKey => $_getSZ(5);
  @$pb.TagNumber(6)
  set resourceKey($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasResourceKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearResourceKey() => clearField(6);

  @$pb.TagNumber(7)
  Workspace get workspace => $_getN(6);
  @$pb.TagNumber(7)
  set workspace(Workspace v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasWorkspace() => $_has(6);
  @$pb.TagNumber(7)
  void clearWorkspace() => clearField(7);
  @$pb.TagNumber(7)
  Workspace ensureWorkspace() => $_ensure(6);
}

class File extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'File', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'daisy'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Data', $pb.PbFieldType.OY, protoName: 'Data')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MimeType', protoName: 'MimeType')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'FileName', protoName: 'FileName')
    ..hasRequiredFields = false
  ;

  File._() : super();
  factory File({
    $core.List<$core.int>? data,
    $core.String? mimeType,
    $core.String? fileName,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    if (mimeType != null) {
      _result.mimeType = mimeType;
    }
    if (fileName != null) {
      _result.fileName = fileName;
    }
    return _result;
  }
  factory File.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory File.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  File clone() => File()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  File copyWith(void Function(File) updates) => super.copyWith((message) => updates(message as File)) as File; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static File create() => File._();
  File createEmptyInstance() => create();
  static $pb.PbList<File> createRepeated() => $pb.PbList<File>();
  @$core.pragma('dart2js:noInline')
  static File getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<File>(create);
  static File? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mimeType => $_getSZ(1);
  @$pb.TagNumber(2)
  set mimeType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMimeType() => $_has(1);
  @$pb.TagNumber(2)
  void clearMimeType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fileName => $_getSZ(2);
  @$pb.TagNumber(3)
  set fileName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFileName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileName() => clearField(3);
}

