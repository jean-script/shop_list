import 'package:shop_list/app/modules/categorys/domain/entities/category_create_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_dto.dart';
import 'package:shop_list/app/modules/categorys/infra/datasources/create_category_datasource.dart';

class CreateCategoryDatasourceImpl extends ICreateCategoryDatasource {
  @override
  Future<CategoryDTO> call(CategoryCreateDTO dto) async {
    return CategoryDTO(
      id: '',
      name: dto.name,
      color: dto.color,
      icon: dto.icon,
    );
  }
}
