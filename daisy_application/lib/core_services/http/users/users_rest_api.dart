import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_rest_api.g.dart';

@RestApi()
abstract class UsersRestApi {
  factory UsersRestApi(Dio dio, {String baseUrl}) = _UsersRestApi;

  @POST('')
  Future<HttpResponse<void>> updateUser(
    @Body() UserModel body,
  );
}
