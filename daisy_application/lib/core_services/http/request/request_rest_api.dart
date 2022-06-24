import 'package:daisy_application/core_services/models/request/request_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'request_rest_api.g.dart';

@RestApi()
abstract class RequestRestApi {
  factory RequestRestApi(Dio dio, {String baseUrl}) = _RequestRestApi;

  @POST('')
  Future<void> createNewRequest(
    @Body() RequestModel body,
  );

  @GET('/title/{title}')
  Future<String> getRequestsByTitle(
    @Path('title') String title,
  );
}
