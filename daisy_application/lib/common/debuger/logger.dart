// ignore_for_file: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart' as tool;
import 'dart:convert';

import 'package:logger/logger.dart';

class Debug {
  static final _debug = tool.Logger(level: tool.Level.debug, printer: _printer);
  static dynamic log = _VarargsFunction(Debug._invoked);

  static void _invoked(List arguments) {
    String rootMessage = '';
    for (final argument in arguments) {
      if (argument is JsonSerializable) {
        rootMessage += ' ${json.encode(argument.toJson())}';
      } else {
        rootMessage += ' $argument';
      }
    }

    _debug.d(rootMessage, '', StackTrace.empty);
  }
}

class Error {
  static final _error = tool.Logger(level: tool.Level.error, printer: _printer);
  static dynamic log = _VarargsFunction(Error._invoked);

  static void _invoked(List arguments) {
    String rootMessage = '';
    for (final argument in arguments) {
      if (argument is JsonSerializable) {
        rootMessage += ' ${json.encode(argument.toJson())}';
      } else {
        rootMessage += ' $argument';
      }
    }

    _error.e(rootMessage);
  }
}

var _printer = PrettyPrinter(
    methodCount: 2, // number of method calls to be displayed
    errorMethodCount: 10, // number of method calls if stacktrace is provided
    lineLength: 120, // width of the output
    colors: false, // Colorful log messages
    printEmojis: false, // Print an emoji for each log message
    printTime: true // Should each log print contain a timestamp
    );

typedef OnCall = dynamic Function(List arguments);

class _VarargsFunction {
  _VarargsFunction(this._onCall);

  final OnCall _onCall;

  @override
  noSuchMethod(Invocation invocation) {
    if (!invocation.isMethod || invocation.namedArguments.isNotEmpty) {
      super.noSuchMethod(invocation);
    }

    final arguments = invocation.positionalArguments;
    return _onCall(arguments);
  }
}
