import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_create_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/create_list_repository.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/create_list_datasource.dart';

class CreateListRepositoryImpl extends ICreateListRepository {
  final ICreateListDatasource _datasource;

  CreateListRepositoryImpl(this._datasource);

  @override
  Future<Either<ListExceptions, ListDTO>> call(ListCreateDTO dto) async {
    try {
      return Right(await _datasource(dto));
    } on ListExceptions catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(ListExceptions(e.toString(), s));
    }
  }
}
