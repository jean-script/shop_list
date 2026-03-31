import 'package:hive_flutter/adapters.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';
import 'package:shop_list/app/modules/product/infra/datasources/edit_product_datasource.dart';

class EditProductDatasourceImpl extends IEditProductDatasource {
  @override
  Future<ProductShopDTO> call(ProductShopDTO dto) async {
    final boxProduct = Hive.box<ProductShopDTO>('ProductList');

    await boxProduct.put(dto.id, dto);
    return dto;
  }
}
