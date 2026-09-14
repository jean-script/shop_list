import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_create_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/exceptions/category_exceptions.dart';
import 'package:shop_list/app/modules/categorys/domain/repositories/create_category_repository.dart';

abstract class ICreateCategoryUsecase {
  Future<Either<CategoryExceptions, CategoryDTO>> call(CategoryCreateDTO dto);
}

class CreateCategoryUsecase extends ICreateCategoryUsecase {
  final ICreateCategoryRepository _repository;

  CreateCategoryUsecase(this._repository);
  @override
  Future<Either<CategoryExceptions, CategoryDTO>> call(CategoryCreateDTO dto) {
    return _repository(dto);
  }
}
