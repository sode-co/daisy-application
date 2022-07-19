import 'package:daisy_application/core_services/models/job_application/job_application_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'job_application_rest_api.g.dart';

@RestApi()
abstract class JobApplicationRestApi {
  factory JobApplicationRestApi(Dio dio, {String baseUrl}) =
      _JobApplicationRestApi;

  @POST('')
  Future<HttpResponse<void>> create(@Body() JobApplicationModel body);

  @GET('')
  Future<HttpResponse<List<JobApplicationModel>>> GetAll();

  @GET('/request/{requestId}')
  Future<HttpResponse<List<JobApplicationModel>>> GetApplicantsOfRequest(
      @Path('requestId') int? requestId);

  @PUT('')
  Future<HttpResponse<void>> approveApplication(
    @Query('requestId') int requestId,
    @Query('freelancerEmail') String freelancerEmail,
  );
}
