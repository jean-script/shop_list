import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_create_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_dto.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/create_list_type_datasource.dart';

class CreateListTypeDatasourceImpl extends ICreateListTypeDatasource {
  @override
  Future<ListTypeDTO> call(ListTypeCreateDTO dto) async {
    return ListTypeDTO(
      id: '',
      title: dto.title,
      color: dto.color,
      icon: dto.icon,
    );
  }
}
