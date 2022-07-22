import 'dart:typed_data';

import 'package:daisy_application/common/config.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/common/file_utils.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/models/resource/resource_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class FileUploadSocketClient {
  Future<void> uploadWorkspaceResource(ResourceModel resource,
          Function(double, FAILURE_TYPE) callback) async =>
      await _performUpload(_buildWorkspaceResourceUploadUrl(resource),
          resource.binary!, callback);

  String _buildWorkspaceResourceUploadUrl(ResourceModel resource) =>
      'ws://${Config.API_HOST}:${Config.API_PORT}/ws/upload-resource/workspace/${resource.workspace!.id}?fileName=${resource.fileName!}&fileType=${resource.fileType!}';

  Future<void> _performUpload(String url, Uint8List bytes,
      Function(double, FAILURE_TYPE) callback) async {
    final ns = 'client-file-streaming-socket-${bytes.length}length';
    Debug.log(ns, 'Start resource into url', url);
    final channel = WebSocketChannel.connect(
      Uri.parse(url),
    );

    List<Uint8List> chunks = bytes.toChunk(1024 * 45);
    final totalProgress = chunks.length;
    double uploadProgress = 0.0;
    channel.sink.add(chunks.first);
    channel.stream.listen((data) async {
      String msg = data as String;

      if (msg != 'ok') {
        Debug.log(ns, 'Upload resource failed with response from server', msg);
        callback(uploadProgress, FAILURE_TYPE.NETWORK_ERROR);
        return;
      }

      uploadProgress = chunks.length / totalProgress;
      chunks.removeAt(0);
      if (chunks.isEmpty) {
        await channel.sink.close();
        return;
      }

      channel.sink.add(chunks.first);
    });
  }
}
