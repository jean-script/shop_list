import 'package:shop_list/app/modules/shop_lists/domain/entities/list_create_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_dto.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/create_list_datasource.dart';

class CreateListDatasourceImpl extends ICreateListDatasource {
  @override
  Future<ListDTO> call(ListCreateDTO dto) async {
    return ListDTO(
      id: '',
      name: dto.name,
      smartGrouping: dto.smartGrouping,
      typeId: dto.typeId,
      items: [],
      budgetLimit: dto.budgetLimit,
    );
  }
}
