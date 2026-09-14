import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/categorys/domain/entities/category_dto.dart';
import 'package:shop_list/app/modules/categorys/domain/exceptions/category_exceptions.dart';

abstract class IGetCategoriesRepository {
  Future<Either<CategoryExceptions, List<CategoryDTO>>> call();
}
