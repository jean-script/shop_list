import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/domain/repositories/get_shop_list_repository.dart';

abstract class IGetShopListUsecase {
  Future<Either<Exception, List<ShopListDTO>>> call();
}

class GetShopListUsecase extends IGetShopListUsecase {
  final IGetShopListRepository _repository;

  GetShopListUsecase(this._repository);

  @override
  Future<Either<Exception, List<ShopListDTO>>> call() {
    return _repository();
  }
}
