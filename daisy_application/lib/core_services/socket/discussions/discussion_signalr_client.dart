import 'dart:async';
import 'dart:convert';
import 'package:daisy_application/core_services/models/discussion/discussion_model.dart';
import 'package:daisy_application/core_services/models/workspace/workspace_model.dart';
import 'package:signalr_netcore/hub_connection.dart';

class DiscussionSignalRClient {
  HubConnection? _hubConnection;
  final WorkspaceModel _workspace;

  DiscussionSignalRClient(this._hubConnection, this._workspace);

  Future<void> connect() async => await _hubConnection!.start();

  Stream<DiscussionModel> streamNewMessages() async* {
    final key = 'discussion-workspace-${_workspace.id}';

    while (_hubConnection != null) {
      var result = await Future.sync(() async {
        Completer completer = Completer<DiscussionModel>();
        _hubConnection!.on(key, (arguments) {
          final discussionJsonText = arguments!.first as String;
          final discussionJsonMap = json.decode(discussionJsonText);
          final discussion = DiscussionModel.fromJson(discussionJsonMap);

          completer.complete(discussion);
        });

        return completer.future;
      });

      yield result as DiscussionModel;
    }
  }

  Future<void> sendMessage(DiscussionModel discussion) async {
    final message = json.encode(discussion.toJson());
    await _hubConnection!.invoke('SendMessage', args: [message]);
  }

  Future<void> end() async {
    await _hubConnection!.stop();
    _hubConnection = null;
  }
}
