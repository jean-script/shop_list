import 'package:shop_list/app/modules/products/domain/entities/product_dto.dart';

abstract class IGetProductsDatasource {
  Future<List<ProductDTO>> call();
}
