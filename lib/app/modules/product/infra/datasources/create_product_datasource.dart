import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';

abstract class ICreateProductDatasource {
  Future<ProductShopDTO> call(ProductShopDTO dto);
}
