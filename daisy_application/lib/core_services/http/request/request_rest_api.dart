import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'request_rest_api.g.dart';

@RestApi()
abstract class RequestRestApi {
  factory RequestRestApi(Dio dio, {String baseUrl}) = _RequestRestApi;

  @POST('')
  Future<void> createNewRequest(
    @Body() Map<String, dynamic> body,
  );

  @GET('/title/{title}')
  Future<String> getRequestsByTitle(
    @Path('title') String title,
  );
}
