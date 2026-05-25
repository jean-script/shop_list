import 'package:shop_list/app/modules/product/domain/entities/category_entity.dart';

abstract class IGetAllCategoryDatasource {
  Future<List<Category>> call();
}
