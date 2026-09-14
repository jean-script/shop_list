import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/products/domain/entities/product_create_dto.dart';
import 'package:shop_list/app/modules/products/domain/entities/product_dto.dart';
import 'package:shop_list/app/modules/products/domain/exceptions/product_exceptions.dart';
import 'package:shop_list/app/modules/products/domain/repositories/create_product_repository.dart';
import 'package:shop_list/app/modules/products/infra/datasources/create_product_datasource.dart';

class CreateProductRepositoryImpl extends ICreateProductRepository {
  final ICreateProductDatasource _datasource;

  CreateProductRepositoryImpl(this._datasource);

  @override
  Future<Either<ProductExceptions, ProductDTO>> call(
    ProductCreateDTO dto,
  ) async {
    try {
      return Right(await _datasource(dto));
    } on ProductExceptions catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(ProductExceptions(e.toString(), s));
    }
  }
}
