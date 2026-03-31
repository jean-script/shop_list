import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';

abstract class IGetShopListDatasource {
  Future<List<ShopListDTO>> call();
}
