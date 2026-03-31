import 'package:hive/hive.dart';

part 'product_shop_entity.g.dart';

@HiveType(typeId: 1)
class ProductShopDTO extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String listId;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final int amount;

  @HiveField(4)
  final double price;

  @HiveField(5)
  final bool isChecked;

  ProductShopDTO({
    required this.id,
    required this.listId,
    required this.name,
    required this.amount,
    required this.price,
    this.isChecked = false,
  });

  double get total => amount * price;

  // factory ProductShopDTO.fromJson(Map<String, dynamic> json) {
  //   return ProductShopDTO(
  //     id: json['id'],
  //     listId: json['listId'],
  //     name: json['name'],
  //     amount: json['amount'],
  //     price: json['price'],
  //     isChecked: json['isChecked'] ?? false,
  //   );
  // }

  // factory ProductShopDTO.create(String listId, String name, double amount) {
  //   return ProductShopDTO(
  //     id: Uuid().v4(),
  //     listId: listId,
  //     name: name,
  //     amount: amount,
  //     price: 0.0,
  //     isChecked: false,
  //   );
  // }

  ProductShopDTO copyWith({
    String? id,
    String? listId,
    String? name,
    int? amount,
    double? price,
    bool? isChecked,
  }) {
    return ProductShopDTO(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      price: price ?? this.price,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'listId': listId,
  //   'name': name,
  //   'amount': amount,
  //   'price': price,
  //   'isChecked': isChecked,
  // };
}
