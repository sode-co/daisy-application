import 'package:daisy_application/core_services/models/health_check_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../common/config.dart';
part 'health_check_rest_api.g.dart';

@RestApi(baseUrl: '${Config.API_URL}/v1/healthcheck')
abstract class HealthCheckRestApi {
  factory HealthCheckRestApi(Dio dio, {String baseUrl}) = _HealthCheckRestApi;

  @GET('')
  Future<HttpResponse<HealthCheckResponseModel>> get();
}
