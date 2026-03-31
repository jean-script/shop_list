import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';

abstract class IDeleteShopListDatasource {
  Future<void> call(ShopListDTO dto);
}
