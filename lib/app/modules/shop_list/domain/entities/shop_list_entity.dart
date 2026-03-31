import 'package:hive/hive.dart';
import 'package:shop_list/app/modules/product/domain/entities/product_shop_entity.dart';

part 'shop_list_entity.g.dart';

@HiveType(typeId: 0)
class ShopListDTO extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final DateTime createdAt;

  @HiveField(3)
  final List<ProductShopDTO> itens;

  @HiveField(4)
  final bool isFinish;

  ShopListDTO({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.itens,
    this.isFinish = false,
  });

  int get totalItens => itens.length;

  double get totalSelecionado => itens
      .where((item) => item.isChecked)
      .fold(0, (total, item) => total + item.total);

  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'name': name,
  //   'createdAt': createdAt,
  //   'itens': itens.map((i) => i.toJson()).toList(),
  //   'isFinish': isFinish,
  // };

  // factory ShopListDTO.fromJson(Map<String, dynamic> json) {
  //   return ShopListDTO(
  //     id: json['id'],
  //     name: json['name'],
  //     itens: json['itens']
  //         .map<ProductShopDTO>((i) => ProductShopDTO.fromJson(i))
  //         .toList(),
  //     createdAt: json['createdAt'],
  //     isFinish: json['isFinish'] ?? false,
  //   );
  // }

  // factory ShopListDTO.create(String name) {
  //   return ShopListDTO(
  //     id: Uuid().v4(),
  //     name: name,
  //     createdAt: DateTime.now(),
  //     itens: [],
  //   );
  // }

  ShopListDTO copyWith({
    String? id,
    String? name,
    DateTime? createdAt,
    bool? isFinish,
    List<ProductShopDTO>? itens,
  }) {
    return ShopListDTO(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      itens: itens ?? this.itens,
      isFinish: isFinish ?? this.isFinish,
    );
  }
}
