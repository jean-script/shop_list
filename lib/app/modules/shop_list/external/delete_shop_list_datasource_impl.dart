import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/infra/datasources/delete_shop_list_datasource.dart';

class DeleteShopListDatasourceImpl extends IDeleteShopListDatasource {
  @override
  Future<void> call(ShopListDTO dto) async {
    final box = Hive.box<ShopListDTO>('ShopList');

    final boxProduct = Hive.box<ProductShopDTO>('ProductList');

    var list = dto.itens;

    for (var item in list) {
      await boxProduct.delete(item.id);
    }

    await box.delete(dto.id);
    // await dto.delete();
  }
}
