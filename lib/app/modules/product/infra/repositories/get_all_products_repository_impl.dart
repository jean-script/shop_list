import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/domain/repositories/get_all_products_repository.dart';
import 'package:shop_list/app/modules/product/infra/datasources/get_all_products_datasource.dart';

class GetAllProductsRepositoryImpl extends IGetAllProductsRepository {
  final IGetAllProductsDatasource _datasource;

  GetAllProductsRepositoryImpl(this._datasource);
  @override
  Future<Either<Exception, List<ProductShopDTO>>> call() async {
    try {
      return Right(await _datasource());
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
