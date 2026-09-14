import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_create_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_type_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';

abstract class ICreateListTypeRepository {
  Future<Either<ListExceptions, ListTypeDTO>> call(ListTypeCreateDTO dto);
}
