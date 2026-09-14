import 'package:shop_list/app/modules/categorys/domain/entities/category_create_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_dto.dart';

abstract class ICreateCategoryDatasource {
  Future<CategoryDTO> call(CategoryCreateDTO dto);
}
