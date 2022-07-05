import 'package:daisy_application/common/safety_utils.dart';

extension EnumExtension on Object {
  bool isEnum(dynamic any) {
    final split = any.toString().split('.');
    return split.length > 1 && split[0] == any.runtimeType.toString();
  }

  String strVal() {
    if (!isEnum(this)) return toString();

    return toString().split('.')[1];
  }
}

extension DynamicAccess on dynamic {
  T? thenReturn<T>(T? data) {
    if (this == null || data == null) return null;

    if (this is num && this == 0) return null;

    if (this is bool && this == false) return null;

    return data;
  }

  T? then<T>(T? Function() execute) {
    if (this == null) return null;

    if (this is num && this == 0) return null;

    if (this is bool && this == false) return null;

    return execute();
  }
}
