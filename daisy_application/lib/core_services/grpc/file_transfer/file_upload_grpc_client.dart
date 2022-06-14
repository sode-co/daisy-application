import 'dart:typed_data';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/common/file_utils.dart';
import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/schema/file_transfer.pbgrpc.dart';
import 'package:daisy_application/service_locator/locator.dart';
import 'package:grpc/grpc_connection_interface.dart';

class FileUploadGrpcClient {
  FileUploadGrpcClient();

  Stream<Chunk> _fileStreaming(ns, Uint8List bytes) async* {
    for (var chunk in bytes.toChunk(1024)) {
      Debug.log(ns, 'reading file chunk with length', chunk.length);
      yield Chunk(content: chunk);
    }
  }

  Future<Result<TransferStatus>> performUpload(Uint8List bytes) async {
    const ns = 'file-reading';
    final ClientChannelBase channel = locator.get();
    final UploadServiceClient client = UploadServiceClient(channel);
    await client.upload(_fileStreaming(ns, bytes));
    await channel.shutdown();
    return Result(data: TransferStatus(status: Status.SUCCESS));
  }
}
