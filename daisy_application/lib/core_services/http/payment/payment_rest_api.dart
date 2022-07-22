import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_rest_api.g.dart';

@RestApi()
abstract class PaymentRestApi {
  factory PaymentRestApi(Dio dio, {String baseUrl}) = _PaymentRestApi;

  Future<Response<
}
