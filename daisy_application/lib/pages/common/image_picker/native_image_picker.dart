import 'dart:typed_data';

import 'package:daisy_application/common/file_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UniversalImagePicker {
  static Future<Uint8List?> getImageAsByte() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile == null) return null;

    return File(xFile.path).toBytes();
  }
}
