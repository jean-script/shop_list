

import 'package:shop_list/app/modules/categorys/domain/entities/category_dto.dart';

abstract class IGetCategoriesDatasource {
  Future<List<CategoryDTO>> call();
}
