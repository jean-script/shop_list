import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/get_list_types_repository.dart';
import 'package:shop_list/app/modules/shop_lists/infra/datasources/get_list_types_datasource.dart';

class GetListTypesRepositoryImpl extends IGetListTypesRepository {
  final IGetListTypesDatasource _datasource;

  GetListTypesRepositoryImpl(this._datasource);

  @override
  Future<Either<ListExceptions, List<ListTypeDTO>>> call() async {
    try {
      return Right(await _datasource());
    } on ListExceptions catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(ListExceptions(e.toString(), s));
    }
  }
}
