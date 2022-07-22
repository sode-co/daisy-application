import 'package:daisy_application/core_services/models/payments/momo_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'payment_rest_api.g.dart';

@RestApi()
abstract class PaymentRestApi {
  factory PaymentRestApi(Dio dio, {String baseUrl}) = _PaymentRestApi;

  @POST('/customer/momo')
  Future<HttpResponse<MomoModel>> createTransaction(
      @Body() Map<String, dynamic> body);
}
