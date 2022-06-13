import 'dart:io';

import 'package:chunked_stream/chunked_stream.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/schema/file_transfer.pbgrpc.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:grpc/grpc_connection_interface.dart';

class FileUploadGrpcClient {
  FileUploadGrpcClient();

  Stream<Chunk> _fileStreaming(ns, File file) async* {
    final reader =
        // ignore: deprecated_member_use
        ChunkedStreamIterator(file.openRead());
    while (true) {
      var data = await reader.read(1024); // read one byte
      if (data.isEmpty) {
        Debug.log(ns, 'End of file reached');
        break;
      }

      Debug.log(ns, 'reading file chunk with length', data.length);
      yield Chunk(content: data);
    }
  }

  Future<Result<TransferStatus>> performUpload(file) async {
    const ns = 'file-reading';
    final ClientChannelBase channel = locator.get();
    final UploadServiceClient client = UploadServiceClient(channel);

    await client.upload(_fileStreaming(ns, file));
    await channel.shutdown();
    return Result(data: TransferStatus(status: Status.SUCCESS));
  }
}
