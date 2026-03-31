import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/domain/repositories/delete_shop_list_repository.dart';

abstract class IDeleteShopListUsecase {
  Future<Either<Exception, void>> call(ShopListDTO dto);
}

class DeleteShopListUsecase extends IDeleteShopListUsecase {
  final IDeleteShopListReposity _reposity;

  DeleteShopListUsecase(this._reposity);

  @override
  Future<Either<Exception, void>> call(ShopListDTO dto) {
    return _reposity(dto);
  }
}
