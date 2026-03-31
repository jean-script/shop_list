import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/infra/datasources/edit_shop_list_datasource.dart';

class EditShopListDatasourceImpl extends IEditShopListDatasource {
  @override
  Future<ShopListDTO> call(ShopListDTO dto) async {
    final box = Hive.box<ShopListDTO>('ShopList');

    await box.put(dto.id, dto);

    return dto;
  }
}
