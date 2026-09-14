import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_dto.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/get_list_types_datasource.dart';

class GetListTypesDatasourceImpl extends IGetListTypesDatasource {
  @override
  Future<List<ListTypeDTO>> call() async {
    return [];
  }
}
