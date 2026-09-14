import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_dto.dart';

abstract class IGetListTypesDatasource {
  Future<List<ListTypeDTO>> call();
}
