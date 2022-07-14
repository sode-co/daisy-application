import 'package:daisy_application/app/common/widget/image_picker/get_image_picker_result.dart';
import 'package:daisy_application/common/file_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:mime_type/mime_type.dart';
import 'package:path/path.dart';

class UniversalImagePicker {
  static Future<GetImagePickerResult> getImage() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    var mimeType = mime(basename(xFile!.name)) ?? 'text/plain; charset=UTF-8';
    return GetImagePickerResult(
        xFile.name, mimeType, File(xFile.path).toBytes());
  }
}
