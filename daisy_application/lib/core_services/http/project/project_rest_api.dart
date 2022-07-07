import 'package:auto_route/auto_route.dart';
import 'package:daisy_application/core_services/models/project/project_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'project_rest_api.g.dart';

@RestApi()
abstract class ProjectRestApi {
  factory ProjectRestApi(Dio dio, {String baseUrl}) = _ProjectRestApi;

  @GET('')
  Future<HttpResponse<List<ProjectModel>>> getAll();

  @GET('/status/{status}')
  Future<HttpResponse<List<ProjectModel>>> getByStatus(
      @Path('status') String status);
}
