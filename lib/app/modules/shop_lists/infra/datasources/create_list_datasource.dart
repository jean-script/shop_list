import 'package:shop_list/app/modules/shop_lists/domain/entities/list_create_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_dto.dart';

abstract class ICreateListDatasource {
  Future<ListDTO> call(ListCreateDTO dto);
}
