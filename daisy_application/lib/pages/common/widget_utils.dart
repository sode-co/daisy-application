import 'package:daisy_application/common/access_utils.dart';
import 'package:daisy_application/common/constants.dart';
import 'package:daisy_application/pages/common/device_info.dart';
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
  DeviceInfo getDeviceInfo() {
    var mediaQuery = MediaQuery.of(this);
    return DeviceInfo(mediaQuery.orientation, mediaQuery.size, getDeviceType(this),
        Size(constrants.maxWidth, constrants.maxHeight));
}
