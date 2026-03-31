import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/domain/repositories/create_product_repository.dart';
import 'package:shop_list/app/modules/product/infra/datasources/create_product_datasource.dart';

class CreateProductRepositoryImpl extends ICreateProductRepository {
  final ICreateProductDatasource _datasource;

  CreateProductRepositoryImpl(this._datasource);

  @override
  Future<Either<Exception, ProductShopDTO>> call(ProductShopDTO dto) async {
    try {
      return Right(await _datasource(dto));
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
