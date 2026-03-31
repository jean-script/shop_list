import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/domain/repositories/edit_shop_list_repository.dart';
import 'package:shop_list/app/modules/shop_list/infra/datasources/edit_shop_list_datasource.dart';

class EditShopListRepositoryImpl extends IEditShopListRepository {
  final IEditShopListDatasource _datasource;

  EditShopListRepositoryImpl(this._datasource);
  @override
  Future<Either<Exception, ShopListDTO>> call(ShopListDTO dto) async {
    try {
      return Right(await _datasource(dto));
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
