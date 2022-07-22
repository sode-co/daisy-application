import 'dart:typed_data';

import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/schema/file_transfer.pbgrpc.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:grpc/grpc_connection_interface.dart';

class FileResource {
  final String resourceKey;
  final Uint8List binary;
  final TransferStatus status;

  FileResource(
      {required this.status, required this.resourceKey, required this.binary});
}

class FileStreamingGrpcClient {
  Stream<FileResource> streamBinaryResource(List<String> resourceKeys) async* {
    ClientChannelBase channel = locator.get();
    ResourceServiceClient client = ResourceServiceClient(channel);

    StreamingResourceFileRequestModel request =
        StreamingResourceFileRequestModel(resourceKeys: resourceKeys);

    await for (var response in client.streamingResourceFile(request)) {
      Debug.log('tiendang-debug', 'response binary',
          Uint8List.fromList(response.binary.content).length);
      yield FileResource(
          status: response.status,
          binary: Uint8List.fromList(response.binary.content),
          resourceKey: response.resourceKey);
    }
  }
}
