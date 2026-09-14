import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/products/domain/entities/product_dto.dart';
import 'package:shop_list/app/modules/products/domain/exceptions/product_exceptions.dart';
import 'package:shop_list/app/modules/products/domain/repositories/get_products_repository.dart';

abstract class IGetProductsUsecase {
  Future<Either<ProductExceptions, List<ProductDTO>>> call();
}

class GetProductsUsecase extends IGetProductsUsecase {
  final IGetProductsRepository _repository;

  GetProductsUsecase(this._repository);
  @override
  Future<Either<ProductExceptions, List<ProductDTO>>> call() {
    return _repository();
  }
}
