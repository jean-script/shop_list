import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/domain/repositories/create_product_repository.dart';

abstract class ICreateProductUsecase {
  Future<Either<Exception, ProductShopDTO>> call(ProductShopDTO dto);
}

class CreateProductUsecase extends ICreateProductUsecase {
  final ICreateProductRepository _repository;

  CreateProductUsecase(this._repository);

  @override
  Future<Either<Exception, ProductShopDTO>> call(ProductShopDTO dto) {
    return _repository(dto);
  }
}
