import 'package:daisy_application/core_services/common/response_handler.dart';
import 'package:daisy_application/core_services/http/category/category_rest_api.dart';

class CategoryService {
  final CategoryRestApi _categoryClient;
  CategoryService(this._categoryClient);

  Future<Result> getAllParentCategories() async {
    final result = await (_categoryClient.getParentCategories().Value());
    if (result.failureType == FAILURE_TYPE.NONE) {
      print(result.data.parentCategories[0]['name']);
      print('--------------');
    }
    return result;
  }

  Future<Result> getChildrenCategoriesByParentName(String parentName) async {
    final result = await (_categoryClient
        .getChildrenCategoriesByParentName(parentName)
        .Value());
    if (result.failureType == FAILURE_TYPE.NONE) {
      print(result.data.childCategories);
      print('--------------');
    }
    return result;
  }
}
