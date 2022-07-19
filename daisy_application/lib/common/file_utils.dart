import 'dart:io';
import 'dart:typed_data';

extension ChunkByteExtension on Uint8List {
  List<Uint8List> toChunk(int chunkSize) {
    int currentIndex = 0;
    List<Uint8List> chunks = [];
    while (currentIndex < length) {
      int lastIndex = currentIndex + chunkSize;
      if (lastIndex > length) lastIndex = length;
      chunks
          .add(Uint8List.fromList(getRange(currentIndex, lastIndex).toList()));
      currentIndex = lastIndex;
    }

    return chunks;
  }
}

extension ChunkFileExtension on File {
  List<Uint8List> toChunk(int chunkSize) => toBytes().toChunk(chunkSize);
}

extension ByteExtesion on File {
  Uint8List toBytes() => readAsBytesSync();
}
