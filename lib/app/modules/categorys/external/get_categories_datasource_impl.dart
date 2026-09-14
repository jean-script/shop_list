
import 'package:shop_list/app/modules/categorys/domain/entities/category_dto.dart';
import 'package:shop_list/app/modules/categorys/infra/datasources/get_categories_datasource.dart';

class GetCategoriesDatasourceImpl extends IGetCategoriesDatasource {
  @override
  Future<List<CategoryDTO>> call() async {
    return [];
  }
}
