import 'package:shop_list/app/modules/shop_lists/domain/entities/list_itens_dto.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/get_list_items_datasource.dart';

class GetListItemsDatasourceImpl extends IGetListItemsDatasource {
  @override
  Future<List<ListItemDTO>> call(String listId) async {
    return [];
  }
}
