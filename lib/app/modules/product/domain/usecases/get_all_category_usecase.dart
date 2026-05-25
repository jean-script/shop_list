import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/product/domain/entities/category_entity.dart';
import 'package:shop_list/app/modules/product/domain/repositories/get_all_category_repository.dart';

abstract class IGetAllCategoryUsecase {
  Future<Either<Exception, List<Category>>> call();
}

class GetAllCategoryUsecase extends IGetAllCategoryUsecase {
  final IGetAllCategoryRepository _repository;

  GetAllCategoryUsecase(this._repository);
  @override
  Future<Either<Exception, List<Category>>> call() {
    return _repository();
  }
}
