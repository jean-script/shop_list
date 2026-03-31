import 'package:hive_flutter/adapters.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/infra/datasources/delete_product_datasource.dart';

class DeleteProductDatasourceImpl extends IDeleteProductDatasource {
  @override
  Future<void> call(ProductShopDTO dto) async {
    final boxProduct = Hive.box<ProductShopDTO>('ProductList');

    await boxProduct.delete(dto.id);
  }
}
