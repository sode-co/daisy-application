// ignore_for_file: non_constant_identifier_names

import 'package:retrofit/dio.dart';

enum FAILURE_TYPE { NONE, AUTH_FAILED, TIMEOUT, NETWORK_ERROR }

class Result<T> {
  final FAILURE_TYPE failureType;
  final T data;

  Result({this.failureType = FAILURE_TYPE.NONE, required this.data});
}

extension ConvertToResult on HttpResponse {
  T Data<T>(Function factoryMethod) => factoryMethod(response.data) as T;

  FAILURE_TYPE FailureType() {
    switch (response.statusCode) {
      case 200:
        return FAILURE_TYPE.NONE;
      case 403:
        return FAILURE_TYPE.AUTH_FAILED;
      default:
        throw UnsupportedError(
            'The status ${response.statusCode} is not supported yet');
    }
  }

  Result<T> Value<T>() {
    return Result(data: response.data, failureType: FailureType());
  }
}
