import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_create_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/exceptions/category_exceptions.dart';
import 'package:shop_list/app/modules/categorys/domain/repositories/create_category_repository.dart';
import 'package:shop_list/app/modules/categorys/infra/datasources/create_category_datasource.dart';

class CreateCategoryRepositoryImpl extends ICreateCategoryRepository {
  final ICreateCategoryDatasource _datasource;

  CreateCategoryRepositoryImpl(this._datasource);

  @override
  Future<Either<CategoryExceptions, CategoryDTO>> call(CategoryCreateDTO dto) async {
    try {
      return Right(await _datasource(dto));
    } on CategoryExceptions catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CategoryExceptions(e.toString(), s));
    }
  }
}
