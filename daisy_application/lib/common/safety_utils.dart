import 'package:json_annotation/json_annotation.dart';

extension SafetyExt on JsonSerializable {
  T? access<T>(String path) {
    if (this is String || _isNumeric(toString())) return null;
    List<String> fields = path.split('.');

    if (fields.isEmpty) return null;

    dynamic value = toJson()[fields.first];
    fields.removeAt(0);

    for (var field in fields) {
      if (value == null) break;

      value = value[field];
    }

    return value;
  }
}

extension SafetyUtils on dynamic {
  bool isNone() {
    if (this == null) return true;

    if (this is String) return this == '';

    return false;
  }

  T? or<T>(T? replacement) {
    if (this.isNone()) return replacement;

    return this;
  }

  bool isBlank() {
    if (this == null) return true;

    if (this is String) return toString().trim() == '';

    return false;
  }
}

bool _isNumeric(String str) => double.tryParse(str) != null;

void main(List<String> args) {
  // Object abc = {'name': 'a'};
  // var a = abc.access('a');

  // print(User().access('name'));
}

class User {
  String name = 'tiendang';
}
