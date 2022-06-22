import 'dart:html';

import 'package:daisy_application/common/constants.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class PlatformHelper {
  static bool isPlatform(Platform platform) => getPlatform() == platform;

  static Platform getPlatform() {
    if (kIsWeb) {
      return Platform.Web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return Platform.Android;
      case TargetPlatform.iOS:
        return Platform.iOS;
      default:
        throw UnsupportedError('Your current platform is not supported');
    }
  }
}
