import 'dart:developer' as developer;

class AppLogger {
  /// Escreve os logs
  static Future<void> log(String message) async {
    developer.log('LOG | $message');
  }

  /// Escreve os logs de erro
  static Future<void> error(Object error, StackTrace stack) async {
    developer.log('LOG ERROR | error: $error');
    developer.log('LOG ERROR | stack: $stack');
  }
}
