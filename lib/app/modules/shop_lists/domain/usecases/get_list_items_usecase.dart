import 'package:fpdart/fpdart.dart';
import 'package:shop_list/app/modules/shop_lists/domain/entities/list_itens_dto.dart';
import 'package:shop_list/app/modules/shop_lists/domain/exceptions/list_exceptions.dart';
import 'package:shop_list/app/modules/shop_lists/domain/repositories/get_list_items_repository.dart';

abstract class IGetListItemsUsecase {
  Future<Either<ListExceptions, List<ListItemDTO>>> call(String listId);
}

class GetListItemsUsecase extends IGetListItemsUsecase {
  final IGetListItemsRepository _repository;

  GetListItemsUsecase(this._repository);
  @override
  Future<Either<ListExceptions, List<ListItemDTO>>> call(String listId) {
    return _repository(listId);
  }
}
