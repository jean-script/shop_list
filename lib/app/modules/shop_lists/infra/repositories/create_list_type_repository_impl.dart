import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_create_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/create_list_type_repository.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/create_list_type_datasource.dart';

class CreateListTypeRepositoryImpl extends ICreateListTypeRepository {
  final ICreateListTypeDatasource _datasource;

  CreateListTypeRepositoryImpl(this._datasource);

  @override
  Future<Either<ListExceptions, ListTypeDTO>> call(ListTypeCreateDTO dto) async {
    try {
      return Right(await _datasource(dto));
    } on ListExceptions catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(ListExceptions(e.toString(), s));
    }
  }
}
