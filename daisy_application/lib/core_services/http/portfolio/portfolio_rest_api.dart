import 'package:daisy_application/core_services/models/portfolio/portfolio_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'portfolio_rest_api.g.dart';

@RestApi()
abstract class PortfolioRestApi {
  factory PortfolioRestApi(Dio dio, {String baseUrl}) = _PortfolioRestApi;

  @GET('/{designerEmail}')
  Future<HttpResponse<PortfolioModel>> getByDesignerEmail(
      @Path('designerEmail') String designerEmail);
}
