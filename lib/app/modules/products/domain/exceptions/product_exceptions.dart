class ProductExceptions implements Exception {
  final String message;
  final StackTrace? stack;

  const ProductExceptions(this.message, [this.stack]);
}
