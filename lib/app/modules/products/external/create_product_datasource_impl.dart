import 'package:shop_list/app/modules/products/domain/entities/product_create_dto.dart';
import 'package:shop_list/app/modules/products/domain/entities/product_dto.dart';
import 'package:shop_list/app/modules/products/infra/datasources/create_product_datasource.dart';

class CreateProductDatasourceImpl extends ICreateProductDatasource {
  @override
  Future<ProductDTO> call(ProductCreateDTO dto) async {
    return ProductDTO(
      id: '',
      name: dto.name,
      price: dto.price,
      categoryId: dto.categoryId,
    );
  }
}
