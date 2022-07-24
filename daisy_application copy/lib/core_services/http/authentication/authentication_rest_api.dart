import 'package:daisy_application/core_services/models/authentication/authentication_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'authentication_rest_api.g.dart';

@RestApi()
abstract class AuthenticationRestApi {
  factory AuthenticationRestApi(Dio dio, {String baseUrl}) =
      _AuthenticationRestApi;

  @POST('/signup')
  Future<HttpResponse<AuthenticationModel>> signUp(
      @Header('Authorization') String googleAccessToken,
      @Body() Map<String, dynamic> body);

  @GET('/access-token')
  Future<HttpResponse<AuthenticationModel>> generateAccessToken(
      @Header('Authorization') String refreshToken);

  @POST('/signin')
  Future<HttpResponse<AuthenticationModel>> signin(
      @Header('Authorization') String googleAccessToken);
}
