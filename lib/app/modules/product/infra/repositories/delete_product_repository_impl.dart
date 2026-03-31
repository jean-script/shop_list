import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/domain/repositories/delete_product_repository.dart';
import 'package:shop_list/app/modules/product/infra/datasources/delete_product_datasource.dart';

class DeleteProductRepositoryImpl extends IDeleteProductRepository {
  final IDeleteProductDatasource _datasource;

  DeleteProductRepositoryImpl(this._datasource);

  @override
  Future<Either<Exception, void>> call(ProductShopDTO dto) async {
    try {
      return Right(await _datasource(dto));
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
