import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/domain/repositories/get_shop_list_repository.dart';
import 'package:shop_list/app/modules/shop_list/infra/datasources/get_shop_list_datasource.dart';

class GetShopListRepositoryImpl extends IGetShopListRepository {
  final IGetShopListDatasource _datasource;

  GetShopListRepositoryImpl(this._datasource);

  @override
  Future<Either<Exception, List<ShopListDTO>>> call() async {
    try {
      return Right(await _datasource());
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
