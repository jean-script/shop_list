import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/get_lists_repository.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/get_lists_datasource.dart';

class GetListsRepositoryImpl extends IGetListsRepository {
  final IGetListsDatasource _datasource;

  GetListsRepositoryImpl(this._datasource);

  @override
  Future<Either<ListExceptions, List<ListDTO>>> call() async {
    try {
      return Right(await _datasource());
    } on ListExceptions catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(ListExceptions(e.toString(), s));
    }
  }
}
