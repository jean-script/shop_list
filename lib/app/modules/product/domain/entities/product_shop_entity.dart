import 'package:hive/hive.dart';
import 'package:shop_list/app/modules/product/domain/entities/category_entity.dart';

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

  @HiveField(6)
  final String? categoryId;

  ProductShopDTO({
    required this.id,
    required this.listId,
    required this.name,
    required this.amount,
    required this.price,
    required this.categoryId,
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
    String? categoryId,
  }) {
    return ProductShopDTO(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      price: price ?? this.price,
      isChecked: isChecked ?? this.isChecked,
      categoryId: categoryId ?? this.categoryId,
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

Future<void> migrateProducts() async {
  final box = Hive.box<ProductShopDTO>('ProductList');
  final boxCategory = Hive.box<Category>('categories');

  final defaultCategoryId = boxCategory.containsKey('outros')
      ? 'outros'
      : boxCategory.values.first.id;

  for (var key in box.keys) {
    final product = box.get(key);

    if (product == null) continue;

    if (product.categoryId == null) {
      final updated = product.copyWith(categoryId: defaultCategoryId);
      await box.put(key, updated);
    }
  }
}
