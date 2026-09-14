class ProductCreateDTO {
  final String name;
  final double price;
  final String categoryId;

  ProductCreateDTO({
    required this.name,
    required this.price,
    required this.categoryId,
  });
}
