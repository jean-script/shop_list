import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_create_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_dto.dart';

abstract class ICreateListTypeDatasource {
  Future<ListTypeDTO> call(ListTypeCreateDTO dto);
}
