import 'package:json_annotation/json_annotation.dart';

extension SafetyExt on JsonSerializable {
  T? access<T>(String path) {
    if (this == null || this is String || _isNumeric(toString())) return null;
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

bool _isNumeric(String str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}

void main(List<String> args) {
  // Object abc = {'name': 'a'};
  // var a = abc.access('a');

  // print(User().access('name'));
}

class User {
  String name = 'tiendang';
}
