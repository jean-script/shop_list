import 'package:shop_list/app/modules/shop_lists/domain/entities/list_itens_dto.dart';

abstract class IGetListItemsDatasource {
  Future<List<ListItemDTO>> call(String listId);
}
