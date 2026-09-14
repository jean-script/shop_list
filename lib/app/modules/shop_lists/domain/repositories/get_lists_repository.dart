import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';

abstract class IGetListsRepository {
  Future<Either<ListExceptions, List<ListDTO>>> call();
}
