import 'package:flutter/cupertino.dart';

class RoutePath {
  const RoutePath(this.pattern, this.builder);

  final String pattern;
  final Widget Function(BuildContext, String) builder;
}
