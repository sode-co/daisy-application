import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'request_rest_api.g.dart';

@RestApi()
abstract class RequestRestApi {
  factory RequestRestApi(Dio dio, {String baseUrl}) = _RequestRestApi;

  @POST('/v1/requests')
  Future<HttpResponse<RequestModel>> createNewRequest(
      @Body() Map<String, dynamic> body);
}
