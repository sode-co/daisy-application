import 'dart:typed_data';

import 'package:daisy_application/common/config.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/common/file_utils.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class FileUploadSocketClient {
  Future<void> performUpload(
      Uint8List bytes, Function(double, FAILURE_TYPE) callback) async {
    final ns = 'client-file-streaming-socket-${bytes.length}length';
    IO.Socket socket = IO.io('http://localhost:2433', <String, dynamic>{
      'transport': ['websocket'],
      'autoconnect': false
    });

    socket.connect();
    List<Uint8List> chunks = bytes.toChunk(1024 * 4);
    final totalProgress = chunks.length;

    double uploadProgress = 0.0;
    socket.onConnect((data) {
      Debug.log(ns, 'Connected to socket server, ready for file streaming');

      Debug.log(ns, 'Send the first chunk with size', chunks.first.length,
          'to server');
      socket.emit('data', chunks.first);

      socket.on('received', (data) {
        String msg = data as String;
        if (msg != 'ok') {
          Debug.log(
              ns, 'Upload resource failed with response from server', msg);
          callback(uploadProgress, FAILURE_TYPE.NETWORK_ERROR);
        }

        uploadProgress = chunks.length / totalProgress;
        chunks.removeAt(0);
        socket.emit('data', chunks.first);
      });
    });
  }
}
