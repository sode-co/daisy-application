// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

enum FAILURE_TYPE {
  NONE,
  AUTH_FAILED,
  TIMEOUT,
  NETWORK_ERROR,
  INTERNAL_SERVER_ERROR
}

class Result<T> {
  final FAILURE_TYPE failureType;
  final T? data;

  Result({this.failureType = FAILURE_TYPE.NONE, required this.data});
}

extension ConvertToResult on Future<HttpResponse> {
  Future<Result<T>> Value<T>() async {
    try {
      final result = await then((value) {
        return Result<T>(data: value.data, failureType: FAILURE_TYPE.NONE);
      }).catchError((err) => throw err);

      return result;
    } on DioError catch (err) {
      FAILURE_TYPE failureType;
      switch (err.response!.statusCode) {
        case 200:
          failureType = FAILURE_TYPE.NONE;
          break;
        case 403:
          failureType = FAILURE_TYPE.AUTH_FAILED;
          break;
        case 500:
          failureType = FAILURE_TYPE.INTERNAL_SERVER_ERROR;
          break;
        default:
          throw UnsupportedError(
              'Error with status ${err.response!.statusCode} is not handling yet');
      }

      return Result<T>(data: null, failureType: failureType);
    }
  }
}
