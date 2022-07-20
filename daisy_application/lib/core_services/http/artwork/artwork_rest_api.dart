import 'package:daisy_application/core_services/models/artwork/artwork_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'artwork_rest_api.g.dart';

@RestApi()
abstract class ArtworkRestApi {
  factory ArtworkRestApi(Dio dio, {String baseUrl}) = _ArtworkRestApi;

  @POST('')
  Future<HttpResponse<void>> create(@Body() ArtworkModel body);
}
