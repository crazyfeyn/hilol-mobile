import 'package:dio/dio.dart';

class CancelTokenManager {
  final Map<String, CancelToken> _tokens = {};

  CancelToken getToken(String key) {
    // If token exists but was cancelled, replace it with a fresh one
    if (_tokens[key]?.isCancelled ?? false) {
      _tokens[key] = CancelToken();
    }
    return _tokens.putIfAbsent(key, () => CancelToken());
  }

  /// Tokenni bekor qilish
  void cancel(String key) {
    if (_tokens.containsKey(key)) {
      _tokens[key]?.cancel("Cancelled by user");
      _tokens.remove(key);
    }
  }

  /// Hammasini tozalash (masalan, dispose paytida)
  void cancelAll() {
    for (var token in _tokens.values) {
      token.cancel("Cancelled all");
    }
    _tokens.clear();
  }

  /// Token mavjudligini tekshirish
  bool contains(String key) => _tokens.containsKey(key);
}
