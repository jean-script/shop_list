import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/exceptions/category_exceptions.dart';
import 'package:shop_list/app/modules/categorys/domain/repositories/get_categories_repository.dart';
import 'package:shop_list/app/modules/categorys/infra/datasources/get_categories_datasource.dart';

class GetCategoriesRepositoryImpl extends IGetCategoriesRepository {
  final IGetCategoriesDatasource _datasource;

  GetCategoriesRepositoryImpl(this._datasource);

  @override
  Future<Either<CategoryExceptions, List<CategoryDTO>>> call() async {
    try {
      return Right(await _datasource());
    } on CategoryExceptions catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CategoryExceptions(e.toString(), s));
    }
  }
}
