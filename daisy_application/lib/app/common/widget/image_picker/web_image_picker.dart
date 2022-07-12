import 'dart:typed_data';
import 'package:image_picker_web/image_picker_web.dart';

class UniversalImagePicker {
  static Future<Uint8List?> getImageAsByte() async =>
      await ImagePickerWeb.getImageAsBytes();
}
