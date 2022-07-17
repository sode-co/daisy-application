import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/core_services/models/workspace/workspace_model.dart';
import 'package:daisy_application/schema/models.pbgrpc.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discussion_model.g.dart';

@JsonSerializable()
class DiscussionModel extends JsonSerializable with HiveObjectMixin {
  int? id;
  UserModel? sender;
  String? type;
  String? content;
  WorkspaceModel? workspace;
  DateTime? createdAt;

  DiscussionModel(
      {this.id,
      this.sender,
      this.type,
      this.content,
      this.workspace,
      this.createdAt});

  DiscussionModel.empty();

  DiscussionModel.fromProto(Discussion proto) {
    id = proto.id;
    sender = UserModel.fromProto(proto.sender);
    type = proto.type;
    content = proto.content;
    workspace = WorkspaceModel.fromProto(proto.workspace);
    createdAt = DateTime.fromMillisecondsSinceEpoch(proto.createdAt.toInt());
  }

  factory DiscussionModel.fromJson(Map<String, dynamic> json) =>
      _$DiscussionModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DiscussionModelToJson(this);
}
