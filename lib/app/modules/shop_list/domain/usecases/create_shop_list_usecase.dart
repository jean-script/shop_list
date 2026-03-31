import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/domain/repositories/create_shop_list_repository.dart';

abstract class ICreateShopListUsecase {
  Future<Either<Exception, ShopListDTO>> call(ShopListDTO dto);
}

class CreateShopListUsecase extends ICreateShopListUsecase {
  final ICreateShopListRepository _repository;

  CreateShopListUsecase(this._repository);

  @override
  Future<Either<Exception, ShopListDTO>> call(ShopListDTO dto) {
    return _repository(dto);
  }
}
