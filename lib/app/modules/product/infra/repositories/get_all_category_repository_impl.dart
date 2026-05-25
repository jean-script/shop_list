import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/category_entity.dart';
import 'package:shop_list/app/modules/product/domain/repositories/get_all_category_repository.dart';
import 'package:shop_list/app/modules/product/infra/datasources/get_all_category_datasouce.dart';

class GetAllCategoryRepositoryImpl extends IGetAllCategoryRepository {
  final IGetAllCategoryDatasource _datasource;

  GetAllCategoryRepositoryImpl(this._datasource);
  @override
  Future<Either<Exception, List<Category>>> call() async {
    try {
      return Right(await _datasource());
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
