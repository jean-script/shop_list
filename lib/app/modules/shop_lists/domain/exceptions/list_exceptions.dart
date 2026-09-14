class ListExceptions implements Exception {
  final String message;
  final StackTrace? stack;

  const ListExceptions(this.message, [this.stack]);
}
