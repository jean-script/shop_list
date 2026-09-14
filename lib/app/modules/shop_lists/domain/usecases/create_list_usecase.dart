import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_create_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/create_list_repository.dart';

abstract class ICreateListUsecase {
  Future<Either<ListExceptions, ListDTO>> call(ListCreateDTO dto);
}

class CreateListUsecase extends ICreateListUsecase {
  final ICreateListRepository _repository;

  CreateListUsecase(this._repository);
  @override
  Future<Either<ListExceptions, ListDTO>> call(ListCreateDTO dto) {
    return _repository(dto);
  }
}
