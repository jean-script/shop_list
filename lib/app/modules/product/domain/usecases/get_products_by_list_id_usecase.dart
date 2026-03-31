import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/domain/repositories/get_products_by_list_id_repository.dart';

abstract class IGetProductsByListIdUsecase {
  Future<Either<Exception, List<ProductShopDTO>>> call(String listId);
}

class GetProductsByListIdUsecase extends IGetProductsByListIdUsecase {
  final IGetProductsByListIdRepository _repository;

  GetProductsByListIdUsecase(this._repository);

  @override
  Future<Either<Exception, List<ProductShopDTO>>> call(String listId) {
    return _repository(listId);
  }
}
