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
