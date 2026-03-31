import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/domain/repositories/get_products_by_list_id_repository.dart';
import 'package:shop_list/app/modules/product/infra/datasources/get_products_by_list_id_datasource.dart';

class GetProductsByListIdRepositoryImpl extends IGetProductsByListIdRepository {
  final IGetProductsByListIdDatasource _datasource;

  GetProductsByListIdRepositoryImpl(this._datasource);

  @override
  Future<Either<Exception, List<ProductShopDTO>>> call(String listId) async {
    try {
      return Right(await _datasource(listId));
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
