import 'package:shop_list/app/modules/shop_lists/domain/entities/list_itens_dto.dart';

class ListDTO {
  final String id;
  final String name;
  final double? budgetLimit;
  final bool smartGrouping;
  final String typeId;
  final List<ListItemDTO> items;

  ListDTO({
    required this.id,
    required this.name,
    required this.smartGrouping,
    required this.typeId,
    required this.items,
    required this.budgetLimit,
  });
}
