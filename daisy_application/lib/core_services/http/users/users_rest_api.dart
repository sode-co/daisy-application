import 'package:daisy_application/core_services/models/user/user_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users_rest_api.g.dart';

@RestApi()
abstract class UsersRestApi {
  factory UsersRestApi(Dio dio, {String baseUrl}) = _UsersRestApi;

  @PUT('')
  Future<HttpResponse<UserModel>> updateUser(
    @Path('Id') int customerId,
    @Body() UserModel body,
  );
}
