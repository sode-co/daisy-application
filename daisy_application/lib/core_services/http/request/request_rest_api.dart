import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'request_rest_api.g.dart';

@RestApi()
abstract class RequestRestApi {
  factory RequestRestApi(Dio dio, {String baseUrl}) = _RequestRestApi;

  @POST('')
  Future<HttpResponse<void>> createNewRequest(
    @Body() RequestModel body,
  );

  @GET('')
  Future<HttpResponse<List<RequestModel>>> getAll();

  @GET('/applied')
  Future<HttpResponse<List<RequestModel>>> getAppliedRequest();
}
