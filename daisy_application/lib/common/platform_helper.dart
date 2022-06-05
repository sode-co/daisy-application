import 'package:daisy_application/common/constants.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class PlatformHelper {
  static bool isPlatform(PLATFORM platform) => getPlatform() == platform;

  static PLATFORM getPlatform() {
    if (kIsWeb) {
      return PLATFORM.Web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return PLATFORM.Android;
      case TargetPlatform.iOS:
        return PLATFORM.iOS;
      default:
        throw UnsupportedError('Your current platform is not supported');
    }
  }
}
