import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/domain/repositories/edit_product_repository.dart';

abstract class IEditProductUsecase {
  Future<Either<Exception, ProductShopDTO>> call(ProductShopDTO dto);
}

class EditProductUsecase extends IEditProductUsecase {
  final IEditProductRepository _repository;

  EditProductUsecase(this._repository);

  @override
  Future<Either<Exception, ProductShopDTO>> call(ProductShopDTO dto) {
    return _repository(dto);
  }
}
