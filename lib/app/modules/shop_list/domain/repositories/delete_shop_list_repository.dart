import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';

abstract class IDeleteShopListReposity {
  Future<Either<Exception, void>> call(ShopListDTO dto);
}
