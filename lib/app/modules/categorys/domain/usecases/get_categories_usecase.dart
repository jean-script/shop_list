import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/exceptions/category_exceptions.dart';
import 'package:shop_list/app/modules/categorys/domain/repositories/get_categories_repository.dart';

abstract class IGetCategoriesUsecase {
  Future<Either<CategoryExceptions, List<CategoryDTO>>> call();
}

class GetCategoriesUsecase extends IGetCategoriesUsecase {
  final IGetCategoriesRepository _repository;

  GetCategoriesUsecase(this._repository);
  @override
  Future<Either<CategoryExceptions, List<CategoryDTO>>> call() {
    return _repository();
  }
}
