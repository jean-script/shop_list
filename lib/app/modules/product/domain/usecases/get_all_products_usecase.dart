import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/domain/repositories/get_all_products_repository.dart';

abstract class IGetAllProductsUsecase {
  Future<Either<Exception, List<ProductShopDTO>>> call();
}

class GetAllProductsUsecase extends IGetAllProductsUsecase {
  final IGetAllProductsRepository _repository;

  GetAllProductsUsecase(this._repository);

  @override
  Future<Either<Exception, List<ProductShopDTO>>> call() {
    return _repository();
  }
}
