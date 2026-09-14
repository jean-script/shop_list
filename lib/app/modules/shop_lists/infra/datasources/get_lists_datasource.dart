import 'package:shop_list/app/modules/shop_lists/domain/entities/list_dto.dart';

abstract class IGetListsDatasource {
  Future<List<ListDTO>> call();
}
