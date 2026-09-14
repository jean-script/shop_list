import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/get_lists_repository.dart';

abstract class IGetListsUsecase {
  Future<Either<ListExceptions, List<ListDTO>>> call();
}

class GetListsUsecase extends IGetListsUsecase {
  final IGetListsRepository _repository;

  GetListsUsecase(this._repository);
  @override
  Future<Either<ListExceptions, List<ListDTO>>> call() {
    return _repository();
  }
}
