class CategoryExceptions implements Exception {
  final String message;
  final StackTrace? stack;

  const CategoryExceptions(this.message, [this.stack]);
}
