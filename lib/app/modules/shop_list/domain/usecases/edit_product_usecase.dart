import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/domain/repositories/edit_shop_list_repository.dart';

abstract class IEditShopListUsecase {
  Future<Either<Exception, ShopListDTO>> call(ShopListDTO dto);
}

class EditShopListUsecase extends IEditShopListUsecase {
  final IEditShopListRepository _repository;

  EditShopListUsecase(this._repository);

  @override
  Future<Either<Exception, ShopListDTO>> call(ShopListDTO dto) {
    return _repository(dto);
  }
}
