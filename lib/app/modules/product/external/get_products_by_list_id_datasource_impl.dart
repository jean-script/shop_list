import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/infra/datasources/get_products_by_list_id_datasource.dart';

class GetProductsByListIdDatasourceImpl extends IGetProductsByListIdDatasource {
  @override
  Future<List<ProductShopDTO>> call(String listId) async {
    final boxProduct = Hive.box<ProductShopDTO>('ProductList');
    return boxProduct.values.where((e) => e.listId == listId).toList();
  }
}
