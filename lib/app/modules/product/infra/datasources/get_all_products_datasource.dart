import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';

abstract class IGetAllProductsDatasource {
  Future<List<ProductShopDTO>> call();
}
