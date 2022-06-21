import 'package:daisy_application/core_services/models/category/category_list_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'category_rest_api.g.dart';

@RestApi()
abstract class CategoryRestApi {
  factory CategoryRestApi(Dio dio, {String baseUrl}) = _CategoryRestApi;

  @GET('/parents')
  Future<HttpResponse<CategoryParentListModel>> getParentCategories();
}
