import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_itens_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';

abstract class IGetListItemsRepository {
  Future<Either<ListExceptions, List<ListItemDTO>>> call(String listId);
}
