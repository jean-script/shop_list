import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/products/domain/entities/product_create_dto.dart';
import 'package:shop_list/app/modules/products/domain/entities/product_dto.dart';
import 'package:shop_list/app/modules/products/domain/exceptions/product_exceptions.dart';

abstract class ICreateProductRepository {
  Future<Either<ProductExceptions, ProductDTO>> call(ProductCreateDTO dto);
}
