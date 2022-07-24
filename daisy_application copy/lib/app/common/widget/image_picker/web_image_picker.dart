import 'package:mime_type/mime_type.dart';
import 'package:daisy_application/app/common/widget/image_picker/get_image_picker_result.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:path/path.dart';

class UniversalImagePicker {
  static Future<GetImagePickerResult> getImage() async {
    var result = await ImagePickerWeb.getImageInfo;
    var mimeType =
        mime(basename(result!.fileName!)) ?? 'text/plain; charset=UTF-8';

    return GetImagePickerResult(result.fileName!, mimeType, result.data!);
  }
}
