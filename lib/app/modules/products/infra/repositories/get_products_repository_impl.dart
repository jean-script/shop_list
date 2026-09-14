import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/products/domain/entities/product_dto.dart';
import 'package:shop_list/app/modules/products/domain/exceptions/product_exceptions.dart';
import 'package:shop_list/app/modules/products/domain/repositories/get_products_repository.dart';
import 'package:shop_list/app/modules/products/infra/datasources/get_products_datasource.dart';

class GetProductsRepositoryImpl extends IGetProductsRepository {
  final IGetProductsDatasource _datasource;

  GetProductsRepositoryImpl(this._datasource);

  @override
  Future<Either<ProductExceptions, List<ProductDTO>>> call() async {
    try {
      return Right(await _datasource());
    } on ProductExceptions catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(ProductExceptions(e.toString(), s));
    }
  }
}
