import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'user_rest_api.g.dart';

@RestApi()
abstract class UserRestApi {
  factory UserRestApi(Dio dio, {String baseUrl}) = _UserRestApi;

  @GET('')
  Future<HttpResponse<UserModel>> getCurrentUser();
}
