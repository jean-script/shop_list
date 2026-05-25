import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/infra/datasources/get_all_products_datasource.dart';

class GetAllProductsDatasourceImpl extends IGetAllProductsDatasource {
  @override
  Future<List<ProductShopDTO>> call() async {
    final boxProduct = Hive.box<ProductShopDTO>('ProductList');
    return boxProduct.values.toList();
  }
}
