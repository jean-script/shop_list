import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_itens_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/get_list_items_repository.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/get_list_items_datasource.dart';

class GetListItemsRepositoryImpl extends IGetListItemsRepository {
  final IGetListItemsDatasource _datasource;

  GetListItemsRepositoryImpl(this._datasource);

  @override
  Future<Either<ListExceptions, List<ListItemDTO>>> call(String listId) async {
    try {
      return Right(await _datasource(listId));
    } on ListExceptions catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(ListExceptions(e.toString(), s));
    }
  }
}
