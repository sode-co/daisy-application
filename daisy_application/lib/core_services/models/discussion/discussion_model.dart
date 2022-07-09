import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:daisy_application/core_services/models/workspace/workspace_model.dart';
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

  factory DiscussionModel.fromJson(Map<String, dynamic> json) =>
      _$DiscussionModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$DiscussionModelToJson(this);
}
