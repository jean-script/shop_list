import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_create_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/create_list_type_repository.dart';

abstract class ICreateListTypeUsecase {
  Future<Either<ListExceptions, ListTypeDTO>> call(ListTypeCreateDTO dto);
}

class CreateListTypeUsecase extends ICreateListTypeUsecase {
  final ICreateListTypeRepository _repository;

  CreateListTypeUsecase(this._repository);
  @override
  Future<Either<ListExceptions, ListTypeDTO>> call(ListTypeCreateDTO dto) {
    return _repository(dto);
  }
}
