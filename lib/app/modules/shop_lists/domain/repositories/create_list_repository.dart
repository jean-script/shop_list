import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_create_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';

abstract class ICreateListRepository {
  Future<Either<ListExceptions, ListDTO>> call(ListCreateDTO dto);
}
