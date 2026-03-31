import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';

abstract class ICreateProductRepository {
  Future<Either<Exception, ProductShopDTO>> call(ProductShopDTO dto);
}
