class ListItemDTO {
  final String id;
  final String productId;

  final String name;
  final double price;
  final double amount;
  final String? unit;
  final bool isFinished;

  ListItemDTO({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.amount,
    this.unit,
    this.isFinished = false,
  });
}
