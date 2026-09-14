import 'package:shop_list/app/modules/products/domain/entities/product_dto.dart';
import 'package:shop_list/app/modules/products/infra/datasources/get_products_datasource.dart';

class GetProductsDatasourceImpl extends IGetProductsDatasource {
  @override
  Future<List<ProductDTO>> call() async {
    return [];
  }
}
