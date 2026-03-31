import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';

abstract class IDeleteProductRepository {
  Future<Either<Exception, void>> call(ProductShopDTO dto);
}
