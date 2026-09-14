import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/products/domain/entities/product_create_dto.dart';
import 'package:shop_list/app/modules/products/domain/entities/product_dto.dart';
import 'package:shop_list/app/modules/products/domain/exceptions/product_exceptions.dart';
import 'package:shop_list/app/modules/products/domain/repositories/create_product_repository.dart';

abstract class ICreateProductUsecase {
  Future<Either<ProductExceptions, ProductDTO>> call(ProductCreateDTO dto);
}

class CreateProductUsecase extends ICreateProductUsecase {
  final ICreateProductRepository _repository;

  CreateProductUsecase(this._repository);
  @override
  Future<Either<ProductExceptions, ProductDTO>> call(ProductCreateDTO dto) {
    return _repository(dto);
  }
}
