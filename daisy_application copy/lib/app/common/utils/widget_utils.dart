import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/common/debugging/logger.dart';
import 'package:daisy_application/app/common/utils/device_info.dart';
import 'package:flutter/material.dart';

ScreenType getDeviceType(MediaQueryData mediaQuery) {
  var orientation = mediaQuery.orientation;

  // Fixed Device width (changes with orientation)
  double deviceWidth = 0;

  if (orientation == Orientation.landscape) {
    deviceWidth = mediaQuery.size.height;
  } else {
    deviceWidth = mediaQuery.size.width;
  }

  if (deviceWidth > 950) {
    return ScreenType.DESKTOP;
  }

  if (deviceWidth > 600) {
    return ScreenType.TABLET;
  }

  return ScreenType.PHONE;
}

extension BuildContextExt on BuildContext {
  get mediaQuery => MediaQuery.of(this);

  DeviceInfo get deviceInfo => DeviceInfo(
      mediaQuery.orientation, getDeviceType(mediaQuery), mediaQuery.size);

  bool isScreenType(ScreenType type) => deviceInfo.deviceScreenType == type;

  void show(Dialog dialog) {
    showDialog(context: this, builder: (context) => dialog);
  }
}
