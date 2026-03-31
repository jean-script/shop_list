import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_list/domain/entities/shop_list_entity.dart';
import 'package:shop_list/app/modules/shop_list/domain/repositories/delete_shop_list_repository.dart';
import 'package:shop_list/app/modules/shop_list/infra/datasources/delete_shop_list_datasource.dart';

class DeleteShopListRepositoryImpl extends IDeleteShopListReposity {
  final IDeleteShopListDatasource _datasource;

  DeleteShopListRepositoryImpl(this._datasource);

  @override
  Future<Either<Exception, void>> call(ShopListDTO dto) async {
    try {
      return Right(await _datasource(dto));
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
