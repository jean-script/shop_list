import 'package:hive/hive.dart';

part 'category_entity.g.dart';

@HiveType(typeId: 2)
class Category extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int color;

  Category({required this.id, required this.name, required this.color});
}

void buildCategoryDefaults() {
  final categoryBox = Hive.box<Category>('categories');

  if (categoryBox.isNotEmpty) return;

  final defaults = [
    Category(id: 'alimentos', name: '🍔 Alimentos', color: 0xFFE57373),
    Category(id: 'bebidas', name: '🥤 Bebidas', color: 0xFF64B5F6),
    Category(id: 'limpeza', name: '🧼 Limpeza', color: 0xFF81C784),
    Category(id: 'higiene', name: '🧴 Higiene', color: 0xFFFFB74D),
    Category(id: 'padaria', name: '🥖 Padaria', color: 0xFFA1887F),
    Category(id: 'frios', name: '🧀 Frios', color: 0xFFFF8A65),
    Category(id: 'congelados', name: '🧊 Congelados', color: 0xFF4FC3F7),
    Category(id: 'outros', name: '📦 Outros', color: 0xFF9E9E9E),
  ];

  for (var category in defaults) {
    categoryBox.put(category.id, category);
  }
}
