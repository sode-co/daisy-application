import 'dart:typed_data';

class GetImagePickerResult {
  final String fileName;
  final String mimeType;
  final Uint8List binary;

  GetImagePickerResult(this.fileName, this.mimeType, this.binary);
}
