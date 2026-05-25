import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/category_entity.dart';

abstract class IGetAllCategoryRepository {
  Future<Either<Exception, List<Category>>> call();
}
