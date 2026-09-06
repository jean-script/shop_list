import 'package:shop_list/app/modules/shop_lists/domain/enums/list_type.dart';

class ListDTO {
  final String name;
  final double? budgetLimit;
  final bool smartGrouping;
  final ListType type;

  ListDTO({
    required this.name,
    required this.smartGrouping,
    required this.type,
    this.budgetLimit,
  });
}
