import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/get_list_types_repository.dart';

abstract class IGetListTypesUsecase {
  Future<Either<ListExceptions, List<ListTypeDTO>>> call();
}

class GetListTypesUsecase extends IGetListTypesUsecase {
  final IGetListTypesRepository _repository;

  GetListTypesUsecase(this._repository);
  @override
  Future<Either<ListExceptions, List<ListTypeDTO>>> call() {
    return _repository();
  }
}
