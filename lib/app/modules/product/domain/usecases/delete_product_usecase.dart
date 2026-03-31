import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/domain/repositories/delete_product_repository.dart';

abstract class IDeleteProductUsecase {
  Future<Either<Exception, void>> call(ProductShopDTO dto);
}

class DeleteProductUsecase extends IDeleteProductUsecase {
  final IDeleteProductRepository _repository;

  DeleteProductUsecase(this._repository);

  @override
  Future<Either<Exception, void>> call(ProductShopDTO dto) {
    return _repository(dto);
  }
}
