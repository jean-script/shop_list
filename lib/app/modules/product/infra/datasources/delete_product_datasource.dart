import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';

abstract class IDeleteProductDatasource {
  Future<void> call(ProductShopDTO dto);
}
