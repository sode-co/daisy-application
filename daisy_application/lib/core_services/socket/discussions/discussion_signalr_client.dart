import 'dart:async';
import 'dart:convert';
import 'package:daisy_application/core_services/models/discussion/discussion_model.dart';
import 'package:daisy_application/core_services/models/workspace/workspace_model.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:signalr_netcore/hub_connection.dart';

class DiscussionSignalRClient {
  HubConnection? _hubConnection;
  WorkspaceModel? _workspace;

  DiscussionSignalRClient(this._hubConnection);

  Future<void> connect() async => await _hubConnection!.start();

  set workspace(WorkspaceModel value) => _workspace = value;

  Stream<DiscussionModel> streamNewMessages() async* {
    final key = 'discussion-workspace-${_workspace!.id}';
    Completer completer = Completer<DiscussionModel>();

    Future.sync(() async {
      _hubConnection!.on(key, (arguments) {
        final discussionJsonText = arguments!.first as String;
        final discussionJsonMap = json.decode(discussionJsonText);
        final discussion = DiscussionModel.fromJson(discussionJsonMap);

        completer.complete(discussion);
      });
    });

    while (_hubConnection != null) {
      yield await completer.future as DiscussionModel;
      completer = Completer<DiscussionModel>();
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
