import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_create_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/exceptions/category_exceptions.dart';

abstract class ICreateCategoryRepository {
  Future<Either<CategoryExceptions, CategoryDTO>> call(CategoryCreateDTO dto);
}
