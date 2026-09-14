import 'package:shop_list/app/modules/products/domain/entities/product_create_dto.dart';
import 'package:shop_list/app/modules/products/domain/entities/product_dto.dart';

abstract class ICreateProductDatasource {
  Future<ProductDTO> call(ProductCreateDTO dto);
}
