import 'package:hive_flutter/adapters.dart';
import 'package:shop_list/app/modules/product/presenter/controllers/product_controller.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/infra/datasources/get_shop_list_datasource.dart';

class GetShopListDatasourceImpl extends IGetShopListDatasource {
  @override
  Future<List<ShopListDTO>> call() async {
    final box = Hive.box<ShopListDTO>('ShopList');

    var shopList = box.values.toList().reversed.toList();

    var newList = <ShopListDTO>[];

    for (var shop in shopList) {
      newList.add(
        shop.copyWith(
          itens: await ProductController.to.getProducByListIdS(shop.id),
        ),
      );
    }

    return newList;
  }
}
