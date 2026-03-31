import 'package:hive/hive.dart';

part 'purchase_history_entity.g.dart';

@HiveType(typeId: 3)
class PurchaseHistory extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late DateTime date;

  @HiveField(3)
  late double total;

  PurchaseHistory({
    required this.id,
    required this.name,
    required this.date,
    required this.total,
  });
}

// Future<void> finishList(ShopListDTO list) async {
//   final box = Hive.box<PurchaseHistoryModel>('history');

//   final history = PurchaseHistoryModel()
//     ..id = list.id
//     ..name = list.name
//     ..date = DateTime.now()
//     ..total = list.totalSelecionado;

//   await box.put(history.id, history);
// }

// List<PurchaseHistoryModel> getByMonth(DateTime date) {
//   final box = Hive.box<PurchaseHistoryModel>('history');

//   return box.values.where((item) {
//     return item.date.month == date.month &&
//            item.date.year == date.year;
//   }).toList();
// }

// List<PurchaseHistoryModel> getByMonth(DateTime date) {
//   final box = Hive.box<PurchaseHistoryModel>('history');

//   return box.values.where((item) {
//     return item.date.month == date.month &&
//            item.date.year == date.year;
//   }).toList();
// }