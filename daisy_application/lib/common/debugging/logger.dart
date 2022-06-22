// ignore_for_file: depend_on_referenced_packages
import 'package:daisy_application/common/varargs_function.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart' as tool;
import 'dart:convert';

import 'package:logger/logger.dart';

class Debug {
  static final _debug = tool.Logger(
      level: tool.Level.debug, printer: _printer, filter: _Filter());
  static dynamic log = VarargsFunction(Debug._invoked);

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
  static final _error = tool.Logger(
      level: tool.Level.error, printer: _printer, filter: _Filter());
  static dynamic log = VarargsFunction(Error._invoked);

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

class _Filter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
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
