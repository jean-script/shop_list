import 'package:shop_list/app/modules/shop_lists/domain/entities/list_dto.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/get_lists_datasource.dart';

class GetListsDatasourceImpl extends IGetListsDatasource {
  @override
  Future<List<ListDTO>> call() async {
    return [];
  }
}
