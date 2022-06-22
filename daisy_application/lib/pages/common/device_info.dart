import 'package:flutter/material.dart';
import 'package:daisy_application/common/constants.dart';

class DeviceInfo {
  final Orientation orientation;
  final ScreenType deviceScreenType;
  final Size screenSize;
  final Size localWidgetSize;
  late AspectRatioType aspectRatioType;

  DeviceInfo(this.orientation, this.deviceScreenType, this.screenSize,
      this.localWidgetSize) {
    aspectRatioType = (screenSize.height / screenSize.width) > 1.8
        ? AspectRatioType.LONG
        : aspectRatioType = AspectRatioType.SHORT;
  }

  @override
  String toString() {
    return 'Orientation:$orientation DeviceType:$deviceScreenType ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
