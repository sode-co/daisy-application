import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/authentication/authentication_model.dart';
part 'authentication_rest_api.g.dart';

@RestApi()
abstract class AuthenticationRestApi {
  factory AuthenticationRestApi(Dio dio, {String baseUrl}) =
      _AuthenticationRestApi;

  @POST('/signup')
  Future<HttpResponse<AuthenticationModel>> signUp(
      @Header('Authorization') String googleAccessToken);

  @GET('/access-token')
  Future<HttpResponse<AuthenticationModel>> generateAccessToken(
      @Header('Authorization') String refreshToken);
}
